# ajirasoft.com

## Getting Started

```
docker-compose up
```

And browse to `http://<docker-machine-ip>:4567`

## Deployment

```
docker-compose run web sh
middleman build
middleman s3_sync
```

## Built With

* Middleman static site generator - middlemanapp.com
* Badass CSS - basscss.com

## Known Issues

* After a while, Vagrant starts eating up all CPU. This is due to the way FS events are done inside a virtual machine, and is a known problem even with grunt/gulp inside VMs. Looking for a known solution to this, it should be trivial.
* Using a FULL build of BassCSS, with a whole lot of unnecessary support (like form styles, table styles, button tag styling, etc). During final hosting, we should use a trimmed custom build at www.basscss.com/customize
* Using Vivus for SVG path animation, and ScrollReveal for scroll animations.
* SVG animation works in mobile, but somehow in Firefox for Mobile - the last "A" in "AJIRA" remains always visible. Needs to be investigated (css properties or vivus options)

## Links for generating the maps

This is needed as there was a need to regenerate Chennai map when Coimbatore
infomation was to be added. So these urls needs to be re-entered when generating
a map for another place.

https://maps.googleapis.com/maps/api/staticmap?center=GoFrugal+Technologies+Private+Limited&zoom=15&size=720x480&maptype=roadmap&markers=color:red%7C12.974424,80.221609

https://maps.googleapis.com/maps/api/staticmap?center=KGiSL+Institute+Of+Technology&zoom=15&size=720x480&maptype=roadmap&markers=color:red%7C11.082372,76.9979855

https://maps.googleapis.com/maps/api/staticmap?center=600+Congress+Ave,+Austin,+TX+78701&zoom=15&size=720x480&maptype=roadmap&markers=color:red%7C30.2686031,-97.7453903