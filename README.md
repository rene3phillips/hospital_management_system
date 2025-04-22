# Quick Guide: Run the Hospital Management System SQL Script

This guide will help you set up your **Hospital Management System** using PostgreSQL and pgAdmin 4.

## What You Need

1. **PostgreSQL** installed on your computer.
2. **pgAdmin 4** (for managing your PostgreSQL databases via a graphical interface).

## Steps to Run the Script

### 1. **Download the SQL File**
Ensure you have the `hospital_schema.sql` file saved on your computer.

### 2. **Open pgAdmin 4**
- Open **pgAdmin 4** on your computer.

### 3. **Create a New Database**
- In **pgAdmin 4**, right-click on "Databases" in the left sidebar and select **Create > Database**.
- Name the database (e.g., `hospital_management_system`) and click **Save**.

### 4. **Open the Query Tool**
- Select the **hospital_management_system** you just created in the left sidebar.
- Click on **Tools** in the top menu and select **Query Tool**.

### 5. **Run the SQL Script**
- In the Query Tool, click the **Open File** icon (the folder icon) to load your `hospital_management_system.sql` file.
- After the file is loaded, click the **Execute/Refresh** button (the lightning bolt icon) to run the script.

### 6. **Done!** The tables are now set up in your database.