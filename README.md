# Assignments 7: Flutter Basic Elements

## Stateful vs Stateless Widget
Stateful widget is a widget that can change when a user interacts with it, whereas a stateless widget never changes. Icon, IconButton, and Text are examples of stateless widgets.

## Widgets I used in this assignment
- `Padding`: Adds padding or empty space around a widget or a bunch of widgets
- `Row`:  Aligns children horizontally
- `Visibility`: Sets children visible or not
- `FloatingActionButton`: A circular icon button that hovers over content to promote a primary action in the application
- `Text`: Displays a string of text

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