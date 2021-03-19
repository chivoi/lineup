# Lineup
### Two-sided marketplace app connecting musicians for putting together the best shows in Melbourne.

[www.complete-your-lineup.heroku.com](https://complete-your-lineup.herokuapp.com/)<br>
[Github repo](https://github.com/chivoi/lineup)
___

## The problem LineUp is solving

Music industry is a tricky place to be in.<br>

If the act is signed with a label, they will have a part or all of their admin taken care of for them, including booking shows. But it's not easy at all to get signed, and many Melbourn musicians stay independent and book their own performances. Which often means that they will mostly work with people they know.

Also, music industry was hit the hardest by COVID pandemic crisis, and many people stopped pursuing music as a result. Professional musicians might have gotten some government support (which was not much), but the unsigned semi-profesionals that make music in their time off their full-time jobs didn't get any incentive to keep going. Being that type of "employed elsewhere" musician myself, I have witnessed a lot of my friends' bands fall apart during that time.<br>

Moreover, the COVID pandemic affected a lot of people on a personal level, where networking face to face in groups of people becomes strange and difficult, and more and more people I know are finding it really hard to get back into it.

***LineUp*** is the app allowing bands/musos find support acts for their shows, and team up to organize shows together.<br>
Hopefully, it will allow to help people rebuild their acts and subsequently Melbourne music industry at large step by step in ways they are comfortable with.

## Why is it a problem that needs solving?

1. Being a successful unsigned musician involves a special sort of networking: meeting people/bands you can organize a show with often happens after hours in bars. This can be good fun for some people, but what if you can't or won't do it?<br> 
Maybe you work full time and have a family, or maybe you are in recovery and can't maintain this type of leisure, or you are simply not that social and hanging out in bars with random characters takes it out of you? What if on top of that the country is dealing with the aftermath of COVID pandemic, and with music industry having taken the hardest hit, all of your friendly bands have fallen apart and you don't know who to do shows with anymore?<br>
This is where LineUp comes in, allowing people to connect online instead of traditional networking.<br>

2. Often, the smaller unsigned acts would not put much thought on who they do a show with, and the night of music can be so diverse, it would be hard to expect big turn up, and people that do turn up might stick around for just their act of interest and not listen to anyone else. <br>
LineUp solves that problem as well, because both on Gig and Musician profiles, the styles of music they play is clearly stated, so the users won't end up having a country, an rnb and a jazz band playing next to each other and can expect good quality crowds.<br>

3. Even when everything mentioned above does not concern certain bands, in an unsigned segment of music industry, when bands book their gigs themselves, people often play shows with their mates, keeping it to however they already know. <br>
LineUp will allow musicians look for fresh faces playing in similar styles to keep the variety present at the shows, as well as in Melbourne music scene at large, leading to new connections and opportunities.

## Purpose

***LineUp*** is the app allowing bands/musos find support acts for their shows, and team up to organize shows together.

## Functionality / features

Gig profile, band profile, teamups, requests, approve/decline request, messaging system, admin/moderator user, cloud images upload, donations w stripe

## Sitemap

## Screenshots

## Target audience

Musicians with full-time employment in other professions, with families, in recovery, not-social personalities and all the rest of the musicians affected by COVID pandemic on different levels.

## Tech stack (e.g. html, css, deployment platform, etc)

* Ruby On Rails
* Front end: Bootstrap, HTML/CSS/SASS, a bit of JavaScript
* Database: PostgreSQL
* Cloud storage: AWS S3
* Testing: Postman, DBeaver
* Deployment: Heroku
* Version control: Github
* Project management: Trello

## User stories for your app

[Trello board with user stories](https://trello.com/b/72F5mdXW/lineup)

## Wireframes for your app

## An ERD for your app

## Explain the different high-level components (abstractions) in your app

## Detail any third party services that your app will use

AWS S3 was used for cloud storage of images. Bootstrap for quick styling. Heroku with a set up CI/CD pipeline was used for continuous deployment.

**Gems:**
* **simple_form** and **nested_form**- for forms
* **devise** - for user authentication 
* **aws-sdk-s3** - to enable AWS cloud storage
* **stripe** - for secure payments
* **cancancan** - for user authorization

## Describe your projects models in terms of the relationships (active record associations) they have with each other

The app has a total of 13 models (not including ability model from CanCanCan and application record).<br>
The two main entities are Gigs and Users.<br>
The Gig has features, styles and types of music.


## Discuss the database relations to be implemented in your application
##	Provide your database schema design
##	Describe the way tasks are allocated and tracked in your project