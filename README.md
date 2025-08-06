# 🧘‍♀️ Patient Treatment Plan Module

A lightweight Rails web application that enables healthcare practitioners to manage patients, create and assign personalized treatment plans, and track appointments, all in one place. Built with usability, scalability, and clinical workflows in mind.

---

## 🚀 Project Overview

**Purpose:**  
Initially to gain experience with Ruby of Rails but will be expanded upon to help healthcare providers efficiently manage their patients’ treatment journeys, from initial appointments to personalized rehabilitation plans, with notification reminders.

---

## ✅ MVP Features (1-Week Scope)

### 1. Patient & Appointment Management
- Create, view, update, and delete patients.
- Book, view, and manage appointments with timestamps and repeat tracking.

### 2. Exercise Library
- Upload exercises with **video or image files**.
- Each exercise includes:
  - Title (auto-formatted to Title Case)
  - Description
- View and edit the full library of exercises.

### 3. Treatment Plan Builder
- Assign one or more exercises to a patient with:
  - Sets
  - Reps
  - Custom instructions
- Save treatment plans and edit them later.
- View a summary of exercises, media previews, and custom notes.

### 4. Notification System (TODO)
- **Email Validator**: Prevents saving invalid patient emails.
- **Patient Reminder** (placeholder): Will notify patients who haven't followed up.
- **Practitioner Prompt** (planned): Will remind clinicians to review plans.

---

## 🧪 Sample Use Case

1. Dr. Jane logs in and uploads a new "Shoulder Mobility" exercise with a short video demo.
2. They assign the exercise to John with custom instructions and 3x10 sets/reps.
3. John receives an email with his treatment plan.
4. Two weeks later, John hasn't booked an appointment, he gets a reminder.
5. One month later, Jane receives a prompt to review John’s plan.

---

## 🔧 Tech Stack

- **Backend**: Ruby on Rails
- **Frontend**: TailwindCSS + StimulusJS
- **Database**: PostgreSQL
- **File Uploads**: Active Storage
- **Authentication**: Devise
- **Email/Reminders**: ActionMailer + ActiveJob

---

## 🛠️ Setup Instructions

1. **Clone the repo**
    ```bash
    git clone https://github.com/yourusername/patient_treatment_plans.git
    cd patient_treatment_plans

2. **Install dependencies**
    ```bash
    bundle install
    yarn install --check-files

3. **Set up database**
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed  # if you have seed data

4. **Run the server**
    ```bash
    ./bin/dev

5. **Visit the app**
    (http://localhost:3000)

---

## 🌱 Future Enhancements

If given more time, the following features could further improve the platform:

- Auto-title-casing for patient and exercise names.
- Email validation for patient accounts.
- File upload constraints (image/video size & type).
- Appointment repeat tracking and completion flags.
- Role-based access for clinics, patients, and admins.
- Interactive progress tracking (e.g., log exercises completed).
- Calendar integration (Google/Outlook) for syncing follow-up reminders.
- Template system for saving reusable treatment plan formats.
- Smart AI suggestions for exercises based on patient injury type.
- Multitenancy support for clinics with multiple practitioners.
- Admin analytics dashboard to monitor usage and compliance.
- HIPAA-compliant file encryption and audit logging.

---

## 👩‍⚕️ Author

**Jordan Watson**
Full-Stack Developer @ Redlen Technologies

---

## 📄 License

This project is for demonstration and educational purposes... For now.
