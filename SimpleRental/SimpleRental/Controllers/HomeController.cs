using SimpleRental.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SimpleRental.Controllers
{
    public class HomeController : Controller
    {
        VideoRentalEntities db = new VideoRentalEntities();

        public ActionResult Index()
        {
            var listtView = from r in db.RentalHeaders
                          join c in db.Customers on r.CustomerFK equals c.CustomerID
                          select new NewList { RentalID = r.RentalID, CustomerName = c.CustomerName, DateRented = r.DateRented };
            return View(listtView);
        }

        public ActionResult Edit(int rentalid)
        {
            NewList editList = new NewList();
            var rentid = db.RentalHeaders.Where(i => i.RentalID == rentalid).FirstOrDefault();
            if (rentid != null)
            {
                editList.RentalID = rentalid;
                editList.CustomerName = db.Customers.Where(c => c.CustomerID == rentid.CustomerFK).Select(n => n.CustomerName).FirstOrDefault();
                editList.DateRented = rentid.DateRented;
                editList.CustomerFK = rentid.CustomerFK;
            }

            //editList.RentedLists = null;
            if (rentalid != 0)
            {
                var movRec = from m in db.Movies
                             join g in db.Genres on m.GenreFK equals g.GenreID
                             join r in db.RentedMovies on m.MovieID equals r.MovieFK
                             where r.RentalFK == rentalid
                             select new RentedList { MovieName = m.MovieName, GenreName = g.GenreName, DateReturned = r.DateReturned, MovieID = m.MovieID, RentedID = r.RentedID };
                editList.RentedLists = movRec.ToList();
            }

            return View(editList);
        }

        [HttpPost]
        public ActionResult Edit(NewList newList, string newMovieIdholder)
        {
            var Rentalheader = new RentalHeader();

            if (newList != null)
            {
                if (newList.RentalID == 0)
                {
                    Rentalheader = new RentalHeader
                    {
                        CustomerFK = newList.CustomerFK,
                        DateRented = newList.DateRented

                    };
                    db.RentalHeaders.Add(Rentalheader);
                    db.SaveChanges();

                    //var RentedMovies = new RentedMovy
                    //{
                    //    MovieFK = Convert.ToInt32(newMovieIdholder),
                    //    DateReturned = null,
                    //    RentalFK = Rentalheader.RentalID
                    //};
                    //db.RentedMovies.Add(RentedMovies);
                    //db.SaveChanges();

                    //*Check if not null!
                    if (!string.IsNullOrEmpty(newMovieIdholder))
                    {
                        //*Convert the value into string Array[] and split w/ comma!
                        string[] newmovies = newMovieIdholder.Split(',');
                        //newmovies = new[] { "1", "2", "5", "6"};

                        //*Loop inside newmovies!
                        for (int i = 0; i < newmovies.Count(); i++)
                        {
                            var RentedMovies = new RentedMovy
                            {
                                MovieFK = Convert.ToInt32(newmovies[i]),
                                DateReturned = null,
                                RentalFK = Rentalheader.RentalID
                            };
                            db.RentedMovies.Add(RentedMovies);
                            db.SaveChanges();
                        }
                    }
                }
                else
                {
                    Rentalheader = db.RentalHeaders.Where(i => i.RentalID == newList.RentalID).FirstOrDefault();
                    if (Rentalheader != null)
                    {
                        Rentalheader.CustomerFK = newList.CustomerFK;
                        Rentalheader.DateRented = newList.DateRented;
                        db.SaveChanges();
                    };

                    if (newList.RentedLists != null)
                    {
                        //movies info
                        foreach (var item in newList.RentedLists)
                        {
                            var RentedMovies = db.RentedMovies.Where(i => i.RentedID == item.RentedID).FirstOrDefault();
                            if (RentedMovies != null)
                            {
                                RentedMovies.MovieFK = item.MovieID;
                                RentedMovies.DateReturned = item.DateReturned;
                                RentedMovies.RentalFK = Rentalheader.RentalID;
                                db.SaveChanges();
                            };
                        }
                    }

                    if (!string.IsNullOrEmpty(newMovieIdholder))
                    {
                        //*Convert the value into string Array[] and split w/ comma!
                        string[] newmovies = newMovieIdholder.Split(',');
                        //newmovies = new[] { "1", "2", "5", "6"};

                        //*Loop inside newmovies!
                        for (int i = 0; i < newmovies.Count(); i++)
                        {
                            var RentedMovies = new RentedMovy
                            {
                                MovieFK = Convert.ToInt32(newmovies[i]),
                                DateReturned = null,
                                RentalFK = Rentalheader.RentalID
                            };
                            db.RentedMovies.Add(RentedMovies);
                            db.SaveChanges();
                        }
                    }

                }

            }
            return RedirectToAction("Edit", new { rentalID = Rentalheader.RentalID });
        }

        public ActionResult CustomerList()
        {
            var customer = db.Customers.ToList();
            return PartialView(customer);
        }

        public ActionResult DdlMovies()
        {
            var movies = db.Movies.ToList();
            return PartialView(movies);
        }

        public ActionResult DdlGenres(int movieId)
        {
            var genrefk = db.Movies.Where(m => m.MovieID == movieId).Select(i => i.GenreFK).FirstOrDefault();
            ViewBag.GenreId = genrefk;

            var genres = db.Genres.ToList();
            return PartialView(genres);
        }

        public ActionResult Delete(int rentalid)
        {
            var rh = db.RentalHeaders.Where(r => r.RentalID == rentalid).FirstOrDefault();
            var rm = db.RentedMovies.Where(r => r.RentalFK == rh.RentalID).FirstOrDefault();
            if (rh != null)
            {
                db.RentalHeaders.Remove(rh);
            }

            if (rm != null)
            {
                db.RentedMovies.Remove(rm);
            }


            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Remove(int rentedMovieID)
        {
            var rented = db.RentedMovies.Where(r => r.RentedID == rentedMovieID).FirstOrDefault();
            var rid = rented.RentalFK;

            if (rented != null)
            {
                db.RentedMovies.Remove(rented);
                db.SaveChanges();
            }

            return RedirectToAction("Edit", new { rentalid = rid });
        }
    }
}