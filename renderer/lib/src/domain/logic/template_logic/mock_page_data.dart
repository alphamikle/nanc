const Map<String, dynamic> mockData = <String, dynamic>{
  'user': {
    'age': 37,
    'name': 'Thomas',
    'lastname': 'Anderson',
    'location': {
      'city': 'Zion',
    },
  },
  'friends': <String>[
    'Link',
    'Morpheus',
    'Niobe',
    'Persephone',
    'The Oracle',
    'Trinity',
  ],
  'enemies': <Map<String, dynamic>>[
    <String, dynamic>{
      'type': 'robot',
      'name': 'Machines',
      'age': 600,
    },
    <String, dynamic>{
      'type': 'agent',
      'name': 'Agent Smith',
      'age': 40,
    },
    <String, dynamic>{
      'type': 'program',
      'name': 'Merovingian',
      'age': 51,
    },
    <String, dynamic>{
      'type': 'program',
      'name': 'The Twins',
      'age': 35,
    },
  ],
};
