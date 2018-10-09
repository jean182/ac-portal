# AC Portal

## Dependencies

- Ruby 2.4.1
- Rails 5.2.1
- PostgreSQL v9.6 or greater

## External Services

* [Amazon S3](https://aws.amazon.com/s3)
* [Sendgrid](https://sendgrid.com)

## Instances

Development - [https://ac-portal-development.herokuapp.com/](https://ac-portal-development.herokuapp.com/)

    Instance which we can deploy specific brances in order to do some testing before merge to staging server or demo to the client. Only for internal purposes.

Staging - [https://ac-portal-staging.herokuapp.com/](https://ac-portal-staging.herokuapp.com/)

    Instance which we deploy new features that are ready for the client to review and approve before pushing to production. Usually on this instance we do demos to the client.

Production - [https://ac-portal.herokuapp.com/](https://ac-portal.herokuapp.com/)

    Instance which will have the released and approved features that the customers are going to use.

## Development Setup

### Define ruby gemset

If using RVM, be sure to set up your gemset:

    cd ac-portal
    echo "ac-portal" > .ruby-gemset
    cd ..
    cd ac-portal

### Update the .env

- Run `cp .env.example .env`
- Edit the .env to specify your specific env variables if needed.

### Update the database.yml

- Run `cp config/database.template.yml config/database.yml`
- Edit the database.yml to specify your specific database username/password if needed.

### Bundle

    gem install bundler
    bundle

### Create database

    rails db:create

### Migrate and seed database

    rails db:setup
