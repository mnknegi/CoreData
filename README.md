# CoreData

### NSPersistentContainer

> `NSPersistentContainer` incapsulates the entire core data stack into a single container, making it easier to setup and managed

It allows us to initialise CoreData stack in only a few lines of code. It handles the configuration and creation of core data stack, including the `managed object model`, `managed object context` and `persistent store coordinator`. It was introduced in iOS 10.0.

### Components managed by NSPersistentContainer

- `NSManagedObjectModel`: The model that describes the scheme of core data object.

- `NSManagedObjectContext`: The context in which we intract with the managed object.

- `NSPersistentStoreCoordinator`: Coordinates the persistent store and managed object context.

```
import CoreData

final class CoreDataStack {

    let persinstentContainer: NSPersistentContainer

    init() {
        persistentContainer = NSPersistentContainer(name: "coredata_file_name_without_extension")
        persistentContainer.loadPersistentStore = { (description, error) in
            if let error {
                fatalError("Failed to load core data stack \(error.localizedDescription).")
            }
        }
    }
    
    var container: NSPersistentContainer {
        persistentContainer.viewContext
    }
}
```

**_NOTE :_** Core Data is not a wrapper around SQLite, it is simply an object graph to be persisted in one of the stores(i.e. SQLite, Binary, XML(in MacOS), In-Memory). We can also use NSAtomicStore or NSIncrementalStore.
