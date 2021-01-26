import sqlite3
import json
from models import Entry

def get_all_entries():
    # Open a connection to the database
    with sqlite3.connect("./dailyjournal.db") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            e.id,
            e.concept,
            e.date_of_entry,
            e.entry,
            e.mood_id
        FROM Entry e
        """)

        # Initialize an empty list to hold all entry representations
        entries = []

        # Convert rows of data into a Python list
        dataset = db_cursor.fetchall()

        # Iterate list of data returned from database
        for row in dataset:

            # Create an entry instance from the current row.
            # Note that the database fields are specified in
            # exact order of the parameters defined in the
            # entry class above.
            entry = Entry(row['id'], row['concept'], row['date_of_entry'],
                            row['entry'], row['mood_id'])

            entries.append(entry.__dict__)

    # Use `json` package to properly serialize list as JSON
    return json.dumps(entries)

def get_single_entry(id):
    with sqlite3.connect("./dailyjournal.db") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Use a ? parameter to inject a variable's value
        # into the SQL statement.
        db_cursor.execute("""
        SELECT
            e.id,
            e.concept,
            e.date_of_entry,
            e.entry,
            e.mood_id
        FROM Entry e
        WHERE e.id = ?
        """, ( id, ))

        # Load the single result into memory
        data = db_cursor.fetchone()

        # Create an entry instance from the current row
        entry = Entry(data['id'], data['concept'], data['date_of_entry'],
                            data['entry'], data['mood_id'])
        return json.dumps(entry.__dict__)

    # To implement tags, define a create function for entries
    # mod it to have two INSERT SQL statements
    # Needs to create data for EntryTags
def create_entry(new_entry):
    with sqlite3.connect("./kennel.db") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        INSERT INTO Entry
            ( name, breed, status, location_id, customer_id )
        VALUES
            ( ?, ?, ?, ?, ?);
        """, (new_entry['name'], new_entry['breed'],
                new_entry['status'], new_entry['location_id'],
                new_entry['customer_id'], ))

        # The `lastrowid` property on the cursor will return
        # the primary key of the last thing that got added to
        # the database.
        id = db_cursor.lastrowid

        # Add the `id` property to the entry dictionary that
        # was sent by the client so that the client sees the
        # primary key in the response.
        new_entry['id'] = id


    return json.dumps(new_entry)