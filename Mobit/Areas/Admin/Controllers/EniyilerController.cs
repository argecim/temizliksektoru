﻿using Mobit.Data.Context;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Mobit.Areas.Admin.Controllers
{
    [_Yetki]
    public class EniyilerController : Controller
    {
        Entities db = new Entities();

        public ActionResult Index()
        {
            var kurumlar = db.Kurumlar.ToList();

            return View(kurumlar);
        }
        public ActionResult Create()
        {
            kategoriler();
            return View();
        }
        public ActionResult SiraGetir()
        {

            var sira = db.Kurumlar.OrderByDescending(sl => sl.Sira).Select(s => s.Sira).FirstOrDefault();

            sira = sira + 1;
            return Content(sira.ToString());
        }
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Kurumlar kurum, HttpPostedFileBase resimYukle)
        {
            string resimDosyaAdi = null;

            #region  resim ve pdf upload işlemleri
            // resim yüklenmese bile klasörü oluştur
            string folderName = Kontrol.ToSlug(kurum.KurumAdi);
            var folder = Server.MapPath("~/Upload/slide");
            if (!Directory.Exists(folder))
            {
                //Directory.CreateDirectory(folder);
            }

            if (resimYukle != null)
            {
                Random rnd = new Random();
                resimDosyaAdi = Path.GetFileNameWithoutExtension(resimYukle.FileName) + "-" + rnd.Next(1, 10000) + Path.GetExtension(resimYukle.FileName);
                var yuklemeYeri = Path.Combine(Server.MapPath("~/Upload/slide" ), resimDosyaAdi);
                resimYukle.SaveAs(yuklemeYeri);
            }

            #endregion
            kurum.Resim = resimDosyaAdi;
            kurum.UploadYolu = folderName;
            kurum.Slug = folderName;
            kurum.Durum = true;
            db.Kurumlar.Add(kurum);
            db.SaveChanges();


            return RedirectToAction("Index");
        }

        public ActionResult Edit(int Id)
        {
            var kurum = db.Kurumlar.Find(Id);

            if (kurum == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            ViewBag.KategoriId = new SelectList(db.Kategoriler.ToList(), "KategoriId", "KategoriAdi", kurum.KategoriId);
            ViewBag.Sponsorlar = new SelectList(db.HaberKategorileri.ToList(), "Ad", "Ad", kurum.Sponsorlar);
            ViewBag.AltKategoriId = new SelectList(db.AltKategoriler.Where(alt => alt.KategoriId == kurum.KategoriId).ToList(), "AltKategoriId", "AltKategoriAdi", kurum.AltKategoriId);
            ViewBag.ilId = new SelectList(db.iller.Where(i => i.ilId == 40 || i.ilId == 82).ToList(), "ilId", "ilAdi", kurum.ilId);
            ViewBag.ilceId = new SelectList(db.ilceler.Where(i => i.ilId == 40 || i.ilId == 82).ToList(), "ilceId", "ilceAdi", kurum.ilceId);
            return View(kurum);
        }

        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Kurumlar kurum, HttpPostedFileBase resimYukle)
        {
            var kurumlar = db.Kurumlar.Find(kurum.KurumId);

            if (kurumlar == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            string resimDosyaAdi = kurumlar.Resim;
            string folderName = kurumlar.UploadYolu;
            // resim dosyası ürün eklenirken oluşturuluyor ama olaki silindiyse yeniden oluştur 
            var folder = Server.MapPath("~/Upload/slide" );
            if (!Directory.Exists(folder))
            {
                //Directory.CreateDirectory(folder);
            }

            if (resimYukle != null)
            {
                Random rnd = new Random();
                resimDosyaAdi = Path.GetFileNameWithoutExtension(resimYukle.FileName) + "-" + rnd.Next(1, 10000) + Path.GetExtension(resimYukle.FileName);
                var yuklemeYeri = Path.Combine(Server.MapPath("~/Upload/slide"), resimDosyaAdi);
                resimYukle.SaveAs(yuklemeYeri);
            }
            kurumlar.KategoriId = kurum.KategoriId;
            kurumlar.AltKategoriId = kurum.AltKategoriId;
            kurumlar.ilId = kurum.ilId;
            kurumlar.ilceId = kurum.ilceId;
            kurumlar.KurumAdi = kurum.KurumAdi;
            kurumlar.Resim = resimDosyaAdi;
            kurumlar.WebSitesi = kurum.WebSitesi;
            if (kurum.Sponsorlar == "Sponsor1")
            {
                kurumlar.Eniyiler = "Sponsor1";
            }
            else if (kurum.Sponsorlar == "Sponsor2")
            {
                kurumlar.Eniyiler = "Sponsor2";
            }
            else if (kurum.Sponsorlar == "Sponsor3")
            {
                kurumlar.Eniyiler = "Sponsor3";
            }
            else if (kurum.Sponsorlar == "Sponsor4")
            {
                kurumlar.Eniyiler = "Sponsor4";
            }
            else if (kurum.Sponsorlar == "Sponsor5")
            {
                kurumlar.Eniyiler = "Sponsor5";
            }
            else if (kurum.Sponsorlar == "Sponsor6")
            {
                kurumlar.Eniyiler = "Sponsor6";
            }           
            else if (kurum.Sponsorlar == "Ayın En İyi Temizlik Şirketi")
            {
                kurumlar.Eniyiler = "HaberPopupAyinEniyiTemizlikSirketi";
            }
            else if (kurum.Sponsorlar == "Ayın En İyi Tedarikçisi")
            {
                kurumlar.Eniyiler = "HaberPopupAyinEniyiTedarikcisi";
            }
            else if (kurum.Sponsorlar == "Ayın En İyi Halı Yıkamacısı")
            {
                kurumlar.Eniyiler = "HaberPopupAyinEniyiUrunu";
            }
            else if (kurum.Sponsorlar == "En İyi Temizlik Şirketleri")
            {
                kurumlar.Eniyiler = "PopupEniyiTemizlikSirketleri";
            }
            else if (kurum.Sponsorlar == "En İyi Ürünler")
            {
                kurumlar.Eniyiler = "PopupEniyiUrunler";
            }
            else if (kurum.Sponsorlar == "En İyi Tedarikçiler")
            {
                kurumlar.Eniyiler = "PopupEniyiTedarikciler";
            }
            else if (kurum.Sponsorlar == "Ayın En İyi Üretici Firması")
            {
                kurumlar.Eniyiler = "HaberPopupAyinEniyiUreticiFirmasi";
            }
            else if (kurum.Sponsorlar == "Ayın En İyi Kuru Temizlemecisi")
            {
                kurumlar.Eniyiler = "HaberPopupAyinEniyiKuruTemizlemecisi";
            }
            else if (kurum.Sponsorlar == "Ayın En İyi Makina Üreticisi")           
            {
                kurumlar.Eniyiler = "HaberPopupAyinEniyiMakinaUreticisi";
            }
            kurumlar.Tel = kurum.Tel;
            kurumlar.Fax = kurum.Fax;
            kurumlar.Email = kurum.Email;
            kurumlar.Adres = kurum.Adres;
            kurumlar.TicSicNo = kurum.TicSicNo;
            kurumlar.KaliteBelgeNo = kurum.KaliteBelgeNo;
            kurumlar.FiyatAraligi = kurum.FiyatAraligi;
            kurumlar.Kurucusu = kurum.Kurucusu;
            kurumlar.KurumMuduru = kurum.KurumMuduru;
            kurumlar.MudurYardimcilari = kurum.MudurYardimcilari;
            kurumlar.TeslimSuresi = kurum.TeslimSuresi;
            kurumlar.GarantiSuresi = kurum.GarantiSuresi;
            kurumlar.MakineCesitleri = kurum.MakineCesitleri;
            kurumlar.MakineOzellikleri = kurum.MakineOzellikleri;
            kurumlar.DigerMakinalar = kurum.DigerMakinalar;
            kurumlar.BagliDernek = kurum.BagliDernek;
            kurumlar.YaptigiHizmetler = kurum.YaptigiHizmetler;
            kurumlar.Referanslar = kurum.Referanslar;
            kurumlar.ServisBolgeleri = kurum.ServisBolgeleri;
            kurumlar.Aktiviteler = kurum.Aktiviteler;
            kurumlar.Aciklama = kurum.Aciklama;
            kurumlar.KurulusTarih = kurum.KurulusTarih;
            kurumlar.Harita = kurum.Harita;
            kurumlar.Video = kurum.Video;
            kurumlar.Durum = kurum.Durum;
            kurumlar.Subeler = kurum.Subeler;
            kurumlar.Egitimciler = kurum.Egitimciler;
            kurumlar.D3Boyutlu = kurum.D3Boyutlu;
            kurumlar.Sponsorlar = kurum.Sponsorlar;
            kurumlar.Panoroma = kurum.Panoroma;
            kurumlar.Sira = kurum.Sira;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public string GetSlug(string slug)
        {
            int count = 0;
            string orgSlug = slug;
            while (db.Kurumlar.Where(u => u.Slug == slug).SingleOrDefault() != null)
            {
                count++;
                var result = db.Kurumlar.Where(u => u.Slug == slug).SingleOrDefault();
                slug = orgSlug + "-" + count;
            }
            return slug;
        }

        void kategoriler()
        {
            ViewBag.Sponsorlar = new SelectList(db.HaberKategorileri.ToList(), "Ad", "Ad");
            ViewBag.KategoriId = new SelectList(db.Kategoriler.ToList(), "KategoriId", "KategoriAdi");
            ViewBag.ilId = new SelectList(db.iller.Where(i => i.ilId == 40 || i.ilId == 82).ToList(), "ilId", "ilAdi");
            ViewBag.ilceId = new SelectList(db.ilceler.Where(i => i.ilId == 40 || i.ilId == 82).ToList(), "ilceId", "ilceAdi");

        }
        public ActionResult AltKategoriGetir(int KategoriId)
        {
            var kategoriler = db.AltKategoriler.Where(k => k.KategoriId == KategoriId).Select(k => new { k.AltKategoriAdi, k.AltKategoriId }).ToList();

            return Json(kategoriler, JsonRequestBehavior.AllowGet);
        }
        //[Route("Kurum/ilceGetir")]
        public ActionResult ilceGetir(int ilId)
        {
            var kategoriler = db.ilceler.Where(k => k.ilId == ilId).Select(k => new { k.ilceAdi, k.ilceId }).ToList();

            return Json(kategoriler, JsonRequestBehavior.AllowGet);
        }


        public ActionResult DeleteFile(int id, string fileName, int? kurumResim)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Kurumlar kurum = db.Kurumlar.Find(id);

            if (kurumResim != null) // ürün tablosu değilde ürün resim tablosundan bir resim silinirse
            {
                KurumResim rsm = db.KurumResim.Find(kurumResim);
                db.KurumResim.Remove(rsm);
            }
            else
            {
                // ürün resmi silindiyse
                if (kurum == null)
                {
                    RedirectToAction("Index");
                }

                if (kurum.Resim == fileName)
                {
                    kurum.Resim = null;
                }

            }



            db.SaveChanges();


            return Redirect("/Admin/Eniyiler/Edit/" + id);
        }

        public ActionResult DeleteFileEgitimciler(int id, string fileName, int? EgitimciId)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Kurumlar kurum = db.Kurumlar.Find(id);

            if (EgitimciId != null) // ürün tablosu değilde ürün resim tablosundan bir resim silinirse
            {
                KurumEgitimciler rsm = db.KurumEgitimciler.Find(EgitimciId);
                db.KurumEgitimciler.Remove(rsm);
            }
            db.SaveChanges();


            return Redirect("/Admin/Eniyiler/Edit/" + id);
        }

        public ActionResult Delete(int id)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Kurumlar kurum = db.Kurumlar.Find(id);

            if (kurum == null)
            {
                RedirectToAction("Index");
            }

            try
            {
                var resimler = kurum.KurumResim.ToList();
                if (resimler != null)
                {
                    foreach (var item in resimler)
                    {
                        db.KurumResim.Remove(item);
                    }
                }
                db.Kurumlar.Remove(kurum);
                db.SaveChanges();

            }
            catch (Exception)
            {


            }

            return RedirectToAction("Index");
        }

        public ActionResult FileUpload(List<HttpPostedFileBase> galeriResim, int kurumId, string uploadYol, string ResimTipi, string aciklama)
        {
            if (galeriResim == null)
            {
                return Redirect("/Admin/Eniyiler/Edit/" + kurumId);
            }

            Kurumlar kurum = db.Kurumlar.Find(kurumId);

            List<KurumResim> kurumResim = new List<KurumResim>();

            foreach (var file in galeriResim)
            {
                if (file.ContentLength > 0)
                {
                    Random rnd = new Random();
                    string dosyaAdi = Path.GetFileNameWithoutExtension(file.FileName) + "-" + rnd.Next(1, 10000) + Path.GetExtension(file.FileName);
                    var yuklemeYeri = Path.Combine(Server.MapPath("~/Upload/slide"), dosyaAdi);
                    file.SaveAs(yuklemeYeri);

                    KurumResim resimler = new KurumResim()
                    {
                        Resim = dosyaAdi,
                        KurumId = kurumId,
                        Aciklama = aciklama,
                        ResimTipi = Convert.ToInt32(ResimTipi)
                    };

                    kurumResim.Add(resimler);
                }
            }

            kurum.KurumResim = kurumResim;
            db.SaveChanges();

            return Redirect("/Admin/Eniyiler/Edit/" + kurumId);
        }
        public ActionResult FileUploadEgitimciYonetici(List<HttpPostedFileBase> galeriResim, int kurumId, string uploadYol, string ResimTipi, string aciklama)
        {
            if (galeriResim == null)
            {
                return Redirect("/Admin/Eniyiler/Edit/" + kurumId);
            }

            Kurumlar kurum = db.Kurumlar.Find(kurumId);

            List<KurumEgitimciler> kurumResim = new List<KurumEgitimciler>();

            foreach (var file in galeriResim)
            {
                if (file.ContentLength > 0)
                {
                    Random rnd = new Random();
                    string dosyaAdi = Path.GetFileNameWithoutExtension(file.FileName) + "-" + rnd.Next(1, 10000) + Path.GetExtension(file.FileName);
                    var yuklemeYeri = Path.Combine(Server.MapPath("~/Upload/slide"), dosyaAdi);
                    file.SaveAs(yuklemeYeri);

                    KurumEgitimciler resimler = new KurumEgitimciler()
                    {
                        Resim = dosyaAdi,
                        KurumId = kurumId,
                        Aciklama = aciklama,
                        Tip = Convert.ToInt32(ResimTipi)
                    };

                    kurumResim.Add(resimler);
                }
            }
            kurum.KurumEgitimciler = kurumResim;
            db.SaveChanges();

            return Redirect("/Admin/Eniyiler/Edit/" + kurumId);
        }

    }
}