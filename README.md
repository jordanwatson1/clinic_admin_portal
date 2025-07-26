# Clinic Admin Portal

A simplified admin interface for healthcare providers to manage patients, appointments, notes, and billing, built with Ruby on Rails.

## Features

- User authentication via Devise
- Patient CRUD: create, view, update, delete patient records
- PostgreSQL for data persistence

## Tech Stack

- Ruby on Rails 8
- PostgreSQL
- Devise for user authentication
- Deployed on Render (coming soon)

## Setup

```bash
git clone https://github.com/yourusername/clinic_admin_portal.git
cd clinic_admin_portal
bundle install
rails db:create db:migrate
rails server