# 🧘‍♀️ Patient Treatment Plan Module

A lightweight Rails web application that enables healthcare practitioners to manage and assign personalized treatment plans with exercise videos/images to their patients. This tool supports patient engagement and clinical follow-up via smart reminders.

---

## 🚀 Project Overview

**Purpose:**  
To help healthcare providers efficiently create, assign, and manage exercise-based treatment plans, while improving patient compliance through automated reminders.

---

## ✅ MVP Features (1-Week Scope)

### 1. Exercise Library Management (Practitioner-facing)
- Upload and store exercise **videos or images**.
- Add new exercises with:
  - Title
  - Description
  - Tags (e.g., "hip mobility", "post-op")
- View, update, and delete saved exercises.

### 2. Treatment Plan Builder (Practitioner-facing)
- Search and select exercises from the database.
- Create a treatment plan that includes:
  - Assigned patient
  - Start date and optional review date
  - Custom notes (e.g., reps, sets, frequency)
- Save plans for future reuse or editing.
- View assigned treatment plans on the patient profile.

### 3. Smart Reminder System (Minimum Implementation)
- **Patient Reminder**: Email patients if they haven’t booked a follow-up appointment X weeks after plan assignment.
- **Practitioner Reminder**: Email practitioners when a treatment plan is approaching its review/update date.

---

## 🧪 Sample Use Case

1. Dr. Jane logs in and uploads a new "Shoulder Mobility" exercise with a demonstration video.
2. She creates a treatment plan for patient Sam, selecting the uploaded exercise and adding custom reps/sets.
3. Sam receives an email with his treatment plan.
4. Two weeks later, Sam hasn't booked an appointment, he gets a reminder.
5. One month later, Jane receives a prompt to review Sam’s plan.

---

## 🔧 Tech Stack

- **Backend**: Ruby on Rails 7
- **Database**: PostgreSQL
- **File Uploads**: Active Storage
- **Authentication**: Devise
- **Email/Reminders**: ActionMailer + ActiveJob (Async)

---

## 🛠️ Setup Instructions

1. **Clone the repo**
    ```bash
    git clone https://github.com/yourusername/clinic_admin_portal.git
    cd clinic_admin_portal

2. **Install dependencies**
    ```bash
    bundle install
    yarn install --check-files

3. **Set up database**
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed

4. **Run the server**
    ```bash
    rails server

5. **Visit the app**
    (http://localhost:3000)

---

## 🌱 Future Enhancements

If given more time, the following features could further improve the platform:

- Patient login portal to view and follow assigned plans.
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

This project is for demonstration and educational purposes only.
