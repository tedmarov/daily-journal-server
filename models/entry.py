class Entry():

    # Class initializer. It has 5 custom parameters, with the
    # special `self` parameter that every method on a class
    # needs as the first parameter.
    def __init__(self, id, concept, date_of_entry, entry, mood_id):
        self.id = id
        self.concept = concept
        self.date_of_entry = date_of_entry
        self.entry = entry
        self.mood_id = mood_id
        # self.mood = None