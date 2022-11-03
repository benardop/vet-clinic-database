/***Database schema structure that represents the entire Database */

CREATE DATABASE clinic;

CREATE TABLE patients (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE
);

CREATE TABLE medical_histories(
    id INT PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status VARCHAR(255)
);

CREATE TABLE treatments(
    id INT PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255)
);

CREATE TABLE invoices(
    id INT PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
    id INT PRIMARY KEY,,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE link_medical_histories_treatments (
    id INT PRIMARY KEY,
    medical_history_id INT REFERENCES medical_histories (id),
    treatment_id INT REFERENCES treatments (id)
);

/**add foreign key references**/
CREATE INDEX patients_id_idx ON patients(id);
CREATE INDEX medical_histories_id_idx ON medical_histories(id);
CREATE INDEX treatments_id_idx ON treatments(id);
CREATE INDEX invoices_id_idx ON invoices(id);
CREATE INDEX invoice_items_id_idx ON invoice_items(id);

CREATE INDEX link_medical_histories_treatments_id_idx ON link_medical_histories_treatments (id);
CREATE INDEX link_medical_histories_treatments_medical_history_id_idx ON link_medical_histories_treatments (medical_history_id);
CREATE INDEX link_medical_histories_treatments_treatment_id_idx ON link_medical_histories_treatments (treatment_id);