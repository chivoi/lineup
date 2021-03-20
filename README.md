# Lineup
### Two-sided marketplace app connecting musicians for putting together the best shows in Melbourne.

[www.complete-your-lineup.heroku.com](https://complete-your-lineup.herokuapp.com/)<br>
___

## The problem LineUp is solving

Music industry is a tricky place to be in.<br>

If the act is signed with a label, they will have a part or all of their admin taken care of for them, including booking shows. But it's not easy at all to get signed, and many Melbourne musicians stay independent and book their own performances. Which often means that they will mostly work with people they know, which often leads to lesser quality lineups.<br>

Also, music industry was hit the hardest by COVID pandemic crisis, and many people stopped pursuing music as a result. Professional musicians might have gotten some government support (which was not much), but the unsigned semi-profesionals that make music in their time off their full-time jobs didn't get any incentive to keep going. Being that type of "employed elsewhere" musician myself, I have witnessed a lot of my friends' bands fall apart during that time.<br>

Moreover, the COVID pandemic affected a lot of people on a personal level, where networking face to face in groups of people becomes strange and difficult, and more and more people I know are finding it really hard to get back into it.

Networking in music industry often involves going out after hours, seeng other people's shows, having a jam and a drink. This is not too inclusive: people with full-time jobs and families, people in recovery and the ones that are not very social by nature might feel left out.

## Why is it a problem that needs solving?

* Life is not life without music and arts and music industry, although recovering, still not doing very well. It needs more good quality shows by independent musicians.

* Many independent mature musicians will benefit from an alternative and more inclusive way of networking.

* This hasn't been done yet, there is no app like this on the market.
## Purpose

***LineUp*** is the app allowing bands/musos find support acts for their existings shows, as well as team up to organize shows together.

It solves the above problems by providing an online environment for musicians to network and put some thought into creating better shows. They can do it at any convenient time at any place without having to commit to a certain lifestyle.

## Functionality / features

**MVP features:**

* CRUD for gigs and profiles for all users;
* CRUD everything for admin;
* Send request for the gig;
* Approve/decline request for your gig;
* User can see their own sent/received requests and posted gigs;
* Teamups: browse musicians' profiles, opportunity to hide user's profile from profiles page if they don't want to be contacted;
* Authentication + authorisation;
* Sign up form nested in Devise registration form;
* Gigs and profile cards include cloud based images;
* Sanitized input for strings;
* Eager loading on gigs, profiles and requests pages;

**Additional features:**

* Search profiles and gigs by location from navbar;
* Filter gigs by availability;
* Messaging system between users;
* Donations: anyone can make a donation if they enjoy the app;
* Automatic emails on creation of a gig and on receiving a new request;
* Deployed with Heroku via CI/CD pipeline;
## Target audience

Musicians of Melbourne.

Especialy more mature ones, with full-time employment in other professions, with families, in recovery, non-social and socially anxious personalities that prefer online networking.

## Tech stack (e.g. html, css, deployment platform, etc)

* **Ruby On Rails**
* **Front end:** Bootstrap, HTML/CSS/SASS, a bit of JavaScript
* **Database:** PostgreSQL
* **Cloud storage:** AWS S3
* **Testing:** Postman, DBeaver
* **Deployment:** Heroku
* **Version control:** Github
* **Project management:** Trello

**External services:**

* _Amazon S3_ was used for cloud storage of images;
* _Bootstrap_ for styling;
* _Heroku with_ a CI/CD pipeline was used for continuous deployment;
* _Mailgun_ for automatic emailing.

**Gems:**
* **simple_form** and **nested_form**- for forms
* **devise** - for user authentication 
* **aws-sdk-s3** - to enable AWS cloud storage
* **stripe** - for secure payments
* **cancancan** - for user authorization
* **mailgun-ruby** - to integrate ActionMailer with Mailgun