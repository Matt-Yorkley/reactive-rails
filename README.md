## "Reactive Rails" with StimulusReflex

This repo contains an example Rails app and various examples of augmenting the app with [StimulusReflex](https://github.com/hopsoft/stimulus_reflex) and [CableReady](https://github.com/hopsoft/cable_ready).

#### Branches

The various branches in this repo have different examples progressively added;

- **master** - the basic example app and least interesting branch
- **install-stimulus-reflex** - two commits installing and setting up StimulusReflex in the existing app
- **reactive-forms** - augments bits of the existing app to add reactive UX / real-time DOM updates via SR
- **live-validation** - adds live form validation feedback with SR 
- **inline-updates** - adds some inline-update functionality to (admin) users index page with SR 
- **modals** - adds some dynamically-rendered modals to the courses page with SR 
- **notifications** - adds a "notifications" feature to the app and adds live DOM feedback via broadcasted multi-user push updates
- **messages** - adds a "messaging" feature to the app and augments it with some basic live-chat functionality on top
- **api** - a quick experiment in refactoring / code organisation between namespaced admin controllers, api controllers, and reflexes.

#### More info

Additional notes and setup will be added in the wiki.
