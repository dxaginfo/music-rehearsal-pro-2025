-- Initial database schema for rehearsal scheduler

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(50) NOT NULL
);

CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  location VARCHAR(255),
  notes TEXT
);

CREATE TABLE rehearsal_attendees (
  id SERIAL PRIMARY KEY,
  rehearsal_id INT NOT NULL REFERENCES rehearsals(id),
  user_id INT NOT NULL REFERENCES users(id),
  attendance_status VARCHAR(50)
);

CREATE TABLE setlists (
  id SERIAL PRIMARY KEY,
  rehearsal_id INT NOT NULL REFERENCES rehearsals(id),
  title VARCHAR(255),
  link_to_material TEXT
);

CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users(id),
  type VARCHAR(50),
  content TEXT,
  sent_at TIMESTAMP
);