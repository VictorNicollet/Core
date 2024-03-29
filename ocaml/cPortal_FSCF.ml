(* © 2012 RunOrg *) 

open Ohm
open Ohm.Universal
open BatPervasives

let owid = Some ConfigWhite.fscf

let splash_css = "/FSCF/splash.css"

let render ?(css=[]) ?(js=[]) ?head ?favicon ?(body_classes=[]) ~title html = 
  Html.print_page
    ~js:(CPageLayout.js false @ js)
    ~css:([Asset.css] @ CPageLayout.white_css owid @ [ splash_css ] @ css)
    ?head
    ~favicon:(ConfigWhite.favicon owid)
    ~title
    ~body_classes:("splash" :: body_classes)
    html

let wrapper info = 
  Asset_Fscf_Page.render (object
    method body = info
    method head = OhmStatic.get_page (info # site) (info # req) "blocks/head.htm"
    method foot = OhmStatic.get_page (info # site) (info # req) "blocks/foot.htm"
  end)

let _ = OhmStatic.export 
  ~render:(OhmStatic.extend ~page:render wrapper)
  ~server:(O.server owid) 
  ~title:   "FSCF"
  Static_FSCF.site
