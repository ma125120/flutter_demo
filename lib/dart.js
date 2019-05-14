{
	// Place your snippets for dart here. Each snippet is defined under a snippet name and has a prefix, body and
	// description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
	// $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the
	// same ids are connected.
	// Example:
	"BuilderContext": {
		"prefix": "BC",
		"body": [
			"BuilderContext context",
		],
		"description": "Log output to console"
	},
	"StatefulWidget": {
		"prefix": "stf",
		"body": [
			"class $0 extends StatefulWidget {\n",
			"\t@override",
		  "\t_$0State createState() => _$0State();",
			"}",
			"class _$0State extends State<$0> {\n",
			"\t@override",
			"\tWidget build(BuildContext context) {",
			"\t\treturn null;",
			"\t}",
			"}",
		]
	},
	"StatelessWidget": {
		"prefix": "stl",
		"body": [
			"class $0 extends StatelessWidget {\n",
			"\t@override",
			"\tWidget build(BuildContext context) {",
			"\t\treturn null;",
			"\t}",
			"}",
		]
	},
	"Scaffold": {
		"prefix": "scaff",
		"body": [
			"Scaffold(",
			"\tappBar: AppBar(",
			"\t\ttitle: Text('$1'),",
			"\t),",
			"\tbody: $2",
			");"
		]
	},
	"floatingActionButton": {
		"prefix": "FAB",
		"body": [
			"floatingActionButton: FloatingActionButton(",
			"\tchild: Icon(Icons.$1),",
			"onPressed: $2",
			"),",
		]
	},
	"initState": {
		"prefix": "init",
		"body": [
			"@override",
			"initState() {",
			"\tsuper.initState();",
			"}",
		]
	},
	"dispose": {
		"prefix": "dis",
		"body": [
			"@override",
			"dispose() {",
			"\tsuper.dispose();",
			"}",
		]
	},
}