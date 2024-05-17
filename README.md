# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.0.0

* Rails version: 6.0.6

* DB: Sqlite

* Run all rspecs by: bundle exec rspec

* Sample for testing endpoints
path: /v1/courses (POST/GET)

POST Body:
{
  "course": {
      "name": " Maths",
      "description": "Mathematics",
      "rating": "3",
      "tutors_attributes": [{
          "first_name": "Test1",
          "email": "test@test.net"
      },
      {
          "first_name": "Lodfu",
          "email": "test123@test.net"
      }
    ]
  }
}
