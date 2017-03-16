# Job Queue
This project is one service used in a more complex project, named [Job Import](https://github.com/skateonrails/job_import).  
See the entire explanation of this project on Job Import page.

## Constraints
Those are the constraints that made me build this application the way it is:

1. This project is responsible to load a `jobs.txt` file into another application, using messaging queue - for that, I have chosen [RabbitMQ](http://www.rabbitmq.com) as my message server, using the [Sneakers Gem](http://sneakers.io/) to publish messages to RabbitMQ.
