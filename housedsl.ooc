import structs/ArrayList

// build the house

house := CustomHouse new("home", |make|
    make floor (1, |make|
        make room ("den")
        make room ("kitchen")
    )
    
    make floor (2, |make|
        make room ("bedroom")
        make room ("batchroom")
    )
)

house println()

// DSL implementation

CustomHouse: class {
    
    name: String
    floors := ArrayList<Floor> new()

    init: func (=name, f: Func(This)) {
        f(this)
    }
    
    floor: func (number: Int, f: Func(Floor)) {
        floors add(Floor new(number, f))
    }
    
    println: func {
        "House named %s has %d floors" format(name, floors size()) println()
        for(f in floors) f println()
    }

}


Floor: class {
    
    number: Int
    rooms := ArrayList<String> new()
    
    init: func (=number, f: Func(This)) {
        f(this)
    }
    
    room: func (type: String) {
        rooms add(type)
    }
    
    println: func {
        "Floor %d has %d rooms (%s)" format(number, rooms size(), rooms join(", ")) println()
    }
    
}

