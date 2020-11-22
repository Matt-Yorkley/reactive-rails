subscriptions = Subscription.create(
  [
    { tier: "Basic", price: 0.00 },
    { tier: "Standard", price: 14.99 },
    { tier: "Premium", price: 49.99 },
  ]
)

Course.create(
  [
    { title: "Websockets with AnyCable", tutor: 'Amy Simmons', image: 1, description: Faker::Lorem.paragraph(sentence_count: 10), starts: 5.weeks.from_now, ends: 6.weeks.from_now, status: "cancelled", subscription: subscriptions[rand(3)] },
    { title: "ActionCable Basics", tutor: 'Sara Florgen', image: 2, description: Faker::Lorem.paragraph(sentence_count: 10), starts: 2.weeks.ago, ends: 2.weeks.from_now, status: "active", subscription: subscriptions[rand(3)] },
    { title: "Custom HTML Elements", tutor: 'Jared White', image: 3, description: Faker::Lorem.paragraph(sentence_count: 10), starts: 12.weeks.from_now, ends: 15.weeks.from_now, status: "active", subscription: subscriptions[rand(3)] },
    { title: "StimulusJS Controllers", tutor: 'Julian Rubisch', image: 4, description: Faker::Lorem.paragraph(sentence_count: 10), starts: 3.weeks.from_now, ends: 7.weeks.from_now, status: "active", subscription: subscriptions[rand(3)] },
    { title: "Stimulus Reflex", tutor: 'Leastbad', image: 5, description: Faker::Lorem.paragraph(sentence_count: 10), starts: 5.weeks.ago, ends: 3.weeks.ago, status: "cancelled", subscription: subscriptions[rand(3)] },
    { title: "Open Source Collaboration", tutor: 'Francois Baptiste', image: 6, description: Faker::Lorem.paragraph(sentence_count: 10), starts: 11.weeks.from_now, ends: 13.weeks.from_now, status: "active", subscription: subscriptions[rand(3)] },
    { title: "Design Processes", tutor: 'Molly Salisbury', image: 7, description: Faker::Lorem.paragraph(sentence_count: 10), starts: 3.weeks.ago, ends: 1.week.ago, status: "active", subscription: subscriptions[rand(3)] },
    { title: "Mobile Testing Web Apps", tutor: 'Jim Frampton', image: 8, description: Faker::Lorem.paragraph(sentence_count: 10), starts: 4.weeks.from_now, ends: 9.weeks.from_now, status: "active", subscription: subscriptions[rand(3)] },
    { title: "TBD - View Components", public: 'false', status: "pending", tutor: 'Jim Frampton', description: Faker::Lorem.paragraph(sentence_count: 10), starts: 4.weeks.from_now, ends: 9.weeks.from_now, subscription: subscriptions[rand(3)] },
    { title: "TBD - LitElement", public: 'false', status: "pending", tutor: 'Jim Frampton', description: Faker::Lorem.paragraph(sentence_count: 10), starts: 4.weeks.from_now, ends: 9.weeks.from_now, subscription: subscriptions[rand(3)] }
  ]
)

User.create(
  [
    { name: "Manager", username: "manager", password: "password", password_confirmation: "password", email: "manager@example.com", admin: true, subscription: subscriptions[rand(3)]},
    { name: "Alice", username: "alice", password: "password", password_confirmation: "password", email: "alice@example.com", subscription: subscriptions[rand(3)]},
    { name: "Bob", username: "bob", password: "password", password_confirmation: "password", email: "bob@example.com", subscription: subscriptions[rand(3)]},
    { name: "Cerri", username: "ceri", password: "password", password_confirmation: "password", email: "cerri@example.com", subscription: subscriptions[rand(3)]},
    { name: "Dave", username: "dave", password: "password", password_confirmation: "password", email: "dave@example.com", subscription: subscriptions[rand(3)]},
  ]
)
