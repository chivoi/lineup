# Lineup
### Two-sided marketplace app connecting musicians for putting together the best shows in Melbourne.

[www.complete-your-lineup.heroku.com](https://complete-your-lineup.herokuapp.com/)<br>
[Github repo](https://github.com/chivoi/lineup)
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

## Sitemap

![sitemap]('./app/assets/images/sitemap.jpeg')

## Screenshots
Home page
![home page]('./app/assets/images/screenshots/home.jpg')<br>
About
![about page]('./app/assets/images/screenshots/about.jpg')<br>
Donation
![donation page]('./app/assets/images/screenshots/donation.jpg')<br>
Gigs
![gigs page]('./app/assets/images/screenshots/gigs.jpg')<br>
Individual gig
![gig page]('./app/assets/images/screenshots/gig.jpg')<br>
Mailbox
![mailbox page]('./app/assets/images/screenshots/mailbox.jpg')<br>
Message
![message page]('./app/assets/images/screenshots/message.jpg')<br>
Payment Success page
![payment success page]('./app/assets/images/screenshots/payment-success.jpg')<br>
Post a gig form
![post a gig form]('./app/assets/images/screenshots/postagig.jpg')<br>
Profiles
![profiles page]('./app/assets/images/screenshots/profiles.jpg')<br>
Individual profile
![profile page]('./app/assets/images/screenshots/profile.jpg')<br>
Registration form
![registration page]('./app/assets/images/screenshots/register.jpg')<br>
Request sent page
![request sent page]('./app/assets/images/screenshots/request.jpg')<br>
User's gigs
![user gigs page]('./app/assets/images/screenshots/user-gigs.jpg')<br>
User's requests
![user requests page]('./app/assets/images/screenshots/user-requests.jpg')<br>
Automatic email
![automatic email]('./app/assets/images/screenshots/request-email.jpg')<br>


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
## User stories for your app

* As a user of the app, I want to be able to create an account and log in to the app to start exploring networking opportunities;
* As a musician, I want to be able to create a profile to give people information about my act, which will allow me to be discovered;
* As a musician, I want to be able to post a gig to find bands to play a show with me to make my search of support act easy;
* As a musician, I want to be able to look for bands that are open to teaming up to organize shows together;
* As a musician, I would like to message other musicians for organizing gigs together or if I have questions;
* As a user of the website, I would like to make a donation to the creators of the app to show my gratitude and support;
* As a musician, I want to approve or decline the requests to join my gig after looking at the applicant's profile;
* As a user of the app, I would like to receive an email when someone has requested my gig not to miss anything;
* As a musician, I want to be able to filter gigs by "filled" because I don't want to waste time looking through all of them;

[My public trello board with all user story cards](https://trello.com/b/72F5mdXW/lineup)

## Wireframes for your app

Below are the wireframes for the app. It includes wireframes for basic features. Pages like: requests, donation, inbox, message, payment success, home and others were added later in process and designed as they appeared.

![wireframes-1]('./app/assets/images/wireframes/1.jpg')<br>
![wireframes-2]('./app/assets/images/wireframes/2.jpg')<br>
![wireframes-3]('./app/assets/images/wireframes/3.jpg')<br>
![wireframes-4]('./app/assets/images/wireframes/4.jpg')<br>
![wireframes-5]('./app/assets/images/wireframes/5.jpg')<br>
## An ERD for your app

![ERD]('./ERD.jpeg')

## Explain the different high-level components (abstractions) in your app

The main two entities in this app is a Gig and a Musician Profile.

There is Gig and Profile controllers, models (interacting with Gig and Profile table accordingly) and a set of views per each: index, show, new and edit views both rendering the _form and _form_profile partials. For the gig there is also a user_gigs view to show the gigs the current user posted.

Profile is created through a nested form on the Devise registrations view, but the rest of the work of this entity goes through it's own views, controller etc. 

Both of those entities have the relation to User entity, which is managed by Devise in our case. User has one profile and zero to many gigs.

Another entity is a Request, which also has it's own controller, a model, a joint table in a database and a couple of views: new as a request successfuly sent page, and show to show the user their sent and received requests.

Requests table in the database is the joint table between users and gigs: user sends a request for a gig. The Requests controller had a functionality to decline or approve a request, which will change the request status from "pending" to "approved" or declined and change the requested gig's status to "filled" as well. User can send many requests for many gigs, and the request can be for a single gig and belong to one user at a time.

There is also a Message and a Conversation entities, each having their own controller, tables in the database, models and index views. A message can belong to one sender and one receiver at a time(both sender and receiver are instances of a User class). Message can belong to one conversation at a time, conversation can have one to many messages. Users can have zero to many messages between each other. Messages are created through received params in the message field (message body).

Among other components are: a Donation with it's own table in the database, controller, model and a view (form). The table has no relations to any other table, any user can input params (name, email and amount) on the new donation page and make a donation. Donation payments are handled by payments controller which creates a Stripe session, redirects the user to the Stripe payment page (through the button "donate" in the new donation view) and in case of success, redirects user to a payment success page.

## Detail any third party services that your app will use

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

## Describe your projects models in terms of the relationships (active record associations) they have with each other

The app has a total of 13 models (not including ability model from CanCanCan and application record).<br>
The two main entities are Gigs and Users.<br>
The Gig has features, styles and types of music.
## Discuss the database relations to be implemented in your application


##	Provide your database schema design


##	Describe the way tasks are allocated and tracked in your project

As this was my first experience with the experience-based user stories, I had to have 2 Trello boards. One with the user stories, and another one with simple todo-style tasks that I understand and that help me organize. The first admin-board cards were labelled on the basis of the task being a "donut", a "sprinkle" and "difficult to implement", and the admin board ones were labelled based on a timeline of the project: stage1 (MVP), stage2, 3 and 4 with mostly "if I have time" type of tasks. 

At the starting stages of the project, I had many ideas and I made many task cards, but as the project went on I had to scale it down multiple times, based on a new data of how long I take to accomplish a task (being new to Rails, it was a bit hard to scope the tasks right away, most of them ended up taking double-tripple the time I initially estimated), so many low-priority cards ended up beign archived or changed. For example, the search feature, initially I wanted to implement an extended search with Ransack gem, but with the time I had, I could only implement a simple one value search through ActiveRecord queries.

All the cards can be viewed on [this public Trello board](https://trello.com/b/i6AEYcmU/lineup-admin).