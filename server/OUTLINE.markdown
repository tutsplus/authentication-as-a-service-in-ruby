*--------------Course Details--------------*

## Instructor: José Mota

## Difficulty: Advanced

## Source Files Location:

https://github.com/josemota/tutsusers-api
https://github.com/josemota/tutsusers-cli

## Topic: Code

## Categories:

Service-Oriented Architecture, Ruby, Single Sign On

## Software/Languages/Frameworks (include version):

Sinatra (master branch on GitHub), Ruby 2+

## Course Rate: $3500

*--------------Course Outline--------------*

# Course Name:

Build a Central Authentication System in Ruby

# Course Description:

# Source Files Description:

Source files on GitHub contain:

1. One Sinatra app for the API that acts as the authentication system;
2. Another Sinatra demo app that connects to the authentication system.

*--------------Course--------------*

# 1. Introduction

## 1.1 Introduction

Welcome to the course! In this lesson you'll be given an introduction to what
you'll learn in terms of material and requirements that should be met.

**Show notes**

- [Official website for the CAS
protocol](http://jasig.github.io/cas/4.0.x/index.html)

## 1.2 Getting to Know the Protocol Specification

Since we'll be implementing an already established protocol, we'll need to
understand its most basic workflow. That way we'll know what we're up to in the
following lessons.

**Show notes**

- [CAS 3.0 Protocol
Specification](https://github.com/Jasig/cas/blob/master/cas-server-documentation/protocol/CAS-Protocol-Specification.md)

# 2 Creating the API Server

## 2.1. The Signup Process - part 1

In order for our users to be able to login, we'll need to have them first! For
that reason we'll start with that use case. We'll bootstrap and develop a
mechanism for signing users up through a very simple Sinatra application.

## 2.2. The Signup Process - part 2

This is part 2 in implementing a user signup use case using a Sinatra
application.

## 2.3. The Signup Page

So far we've been implementing the signup process without even resorting to a
webpage, just a test driven process. We'll begin implementing a visual
representation of the signup process in this lesson.

## 2.4. Login Tickets - part 1

The CAS protocol refers an asset called the login ticket. We'll learn about its
role in the login process and test drive your code towards its implementation.

## 2.5. Login Tickets - part 2

This is part 2 on implementing login tickets as a key asset in our login
process.

## 2.6. Ticket Granting Cookies - part 1

Now that we have login tickets in our system, let's move on towards another
asset that's as fundamental: the ticket granting cookies. They are the gateway
towards a successful authentication across multiple services.

## 2.7. Ticket Granting Cookies - part 2

This is part 2 on implementing the ticket granting cookies in our login
process.

## 2.8. Validate Service Tickets

Service tickets are important to establish a proper session in each of our
applications. They will trigger the mechanism that will effectively retrieve
our user data to be used in our application.

## 2.9. Consolidate the Login Process into the Application - part 1

So far we've been building our application in chunks, guided by tests. This
process is good because we isolate the expected behaviors and tackle them
through tests. Now is the time to integrate everything together.

## 2.10. Consolidate the Login Process into the Application - part 2

This is part 2 in consolidating our work into a single, cohesive web
application.

## 2.11. Consolidate the Validation Process into the Application

We're moving our way towards a single web application that matches our
expectations. We're reaching the point where we can safely test the whole login
procedure in one set. But we still to clear some edges before doing so.

# 2.12. Final Assembly

This is the final video on creating the authentication server. We'll be
finetouching our application code in order to fully comply with the
specification we're following.

# 3 A Client Demonstration App

## 3.1. Implmenting a Client Application - part 1

Now that our server is up and running, we can focus our attention on building a
client application that requires an external authentication server. We'll also
use Sinatra for this app for simplicity sake but any framework or any language
will do.

## 3.2. Implmenting a Client Application - part 2

This is part 2 on implementing a client application that will consume the
authentication server's data. At this point in the course we should have a
fully interoperational system, with client and server communicating back and
forth successfully.

# 4 Conclusion

## 4.1 Final Review

**Show notes**

- [RubyCAS implementation](http://github.com/rubycas/rubycas-server)
