Nouns:
Students

student names
cohort names

cohort start date

students cohorts

Table Students:
id
name
cohort_id

Table Cohort:
cohort_id
cohort_name
cohort_starting_date

CRAETE TABLE students (
id SERIAL PRIMARY KEY,
name text,
cohort_id int,
constraint fk_cohort foreign key(cohort_id) references cohorts(id) on delete cascade

)
