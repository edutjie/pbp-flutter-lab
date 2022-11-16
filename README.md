# Assignments 7: Flutter Basic Elements

## Stateful vs Stateless Widget
Stateful widget is a widget that can change when a user interacts with it, whereas a stateless widget never changes. Icon, IconButton, and Text are examples of stateless widgets.

## Widgets I used in this assignment
- `Padding`: Adds padding or empty space around a widget or a bunch of widgets.
- `Row`:  Aligns children horizontally.
- `Visibility`: Sets children visible or not.
- `FloatingActionButton`: A circular icon button that hovers over content to promote a primary action in the application.
- `Text`: Displays a string of text.

## What is the function of `setState()`? What variables are affected by it?
`setState()` function is to notify the framework that the internal state of this object has changed which causes the framework to schedule a build for this State object. The variables that are affected by `setState()` depends on what variable you pass inside the `setState() `function.

## `const` vs `final` in Dart?
Both are immutable but you can't use `const` for a value that is compiled at runtime, so if you want to use `const` you must know the value at compile time, ex: `const a = 1`. Therefor, `final` should be used over `const` if you don't know the value at compile time, and it will be calculated/grabbed at runtime. 

## Implementation
1. Run `flutter create counter_7`
2. Edit `lib/main.dart`:
	1. Create decreament counter function:
		```dart
		void _decrementCounter() {
			setState(() {
				if (_counter > 0) {
					_counter--;
				}
			});
		}
		```
	2. Add logic to GANJIL-GENAP text:
		```dart
		children: <Widget>[
			_counter % 2 == 0
				? const Text('GENAP',
					style: TextStyle(color: Colors.redAccent))
				: const Text('GANJIL',
			style: TextStyle(color: Colors.blueAccent)),
			Text(
				'$_counter',
				style: Theme.of(context).textTheme.headline4,
			),
		],
		```
	3. Modify `floatingActionButton`:
		```dart
		floatingActionButton: Padding(
			padding: const EdgeInsets.only(left: 30),
			child: Row(
			mainAxisAlignment: MainAxisAlignment.spaceBetween,
			children: [
				Visibility(
					visible: _counter != 0,
					child: FloatingActionButton(
						onPressed: _decrementCounter,
						tooltip: 'Decrement',
						backgroundColor:
							_counter == 0 ? Colors.grey : Colors.blueAccent,
						child: const Icon(Icons.remove),
					)
				),
				FloatingActionButton(
					onPressed: _incrementCounter,
					tooltip: 'Increment',
					child: const Icon(Icons.add),
				),
			],
		)) // This trailing comma makes auto-formatting nicer for build
		```

	4. `git` `add`-`commit`-`push` Assignment


# Assignment 8: Flutter Form

## `Navigator.push` vs `Navigator.pushReplacement`
`Navigator.push` pushes the route into the stack on top of the current page, thereby displaying the second route. Meanwhile, `Navigator.pushReplacement` replaces the current page with the route you want to push.

## Widgets that I used in this assignment
- `DropdownButton`: Lets the user select from a number of items.
- `DropdownHideUnderline`: Removes Underline from `DropdownButton`.
- `TextButton`: It is a simple Button without any border that listens for _onPressed_ and _onLongPress_ gestures.
- `ListView.builder`: Builds the children on demand. This constructor is appropriate for list views with a large (or infinite) number of children.
- `ListTile`: Used to populate a ListView in _Flutter_. It contains title as well as leading or trailing icons.
- `Material`: A convenience widget that wraps a number of widgets that are commonly required for applications implementing _Material_ Design.

## Events in Flutter
- `onPressed`: This callback will be called when the user taps on an object.
- `onTap`: Called when the user taps on the render object.
- `onChanged`: Called when the user initiates a change to the TextField's or other fields' value.

## How `Navigator` navigate to another page in Flutter
When we navigate to another screen, we use the `push` methods and `Navigator` widget adds the new screen onto the top of the stack. Naturally, the `pop` methods would remove that screen from the stack.

## Implementation
1. Make `drawer.dart` that contains `DrawerApp` that will be used as main's, data_budget's and tambah_budget's drawer to navigate pages.
   ```dart
	drawer: const DrawerApp(),
	```
2. Make a form that accepts `String judul`, `int nominal`, `String jenisBudget` and `date` as the inputs in `tambah_budget.dart`.
3. Make a `Budget` class in `tambah_budget.dart` that accepts the same inputs as the form.
   ```dart
   class Budget {
	late String judul;
	late int nominal;
	late String jenisBudget;
	late DateTime date;
	
	Budget({
			required this.judul, 
			required this.nominal, 
			required this.jenisBudget, 
			required this.date
		});
	}
	```
4. Make `globals.dart` that contains global variable `budgets` which is a list of `Budget`.
   ```dart
	// globals.dart
	library counter_7.globals;
	import 'package:counter_7/tambah_budget.dart';
	
	List<Budget> budgets = [];
	```
4. Show the data in `globals.budgets` in `data_budget.dart` using `ListView.builder` that contains `ListTile`.
5. Decorate.
