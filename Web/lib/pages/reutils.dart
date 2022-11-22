// return Form(
// child: Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Modificar datos de un usuario',
// style: Theme.of(context).textTheme.headline4,
// ),
// SizedBox(
// height: 80,
// ),
// Text('Datos personales'),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Nombre'),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Apellido'),
// ),
// ),
// ),
// ),
// ],
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Fecha de nacimiento'),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Genero'),
// ),
// ),
// ),
// ),
// ],
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Contraseña'),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Repetir contraseña'),
// ),
// ),
// ),
// ),
// ],
// ),
// Text('Datos de contacto'),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Email'),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Teléfono'),
// ),
// ),
// ),
// ),
// ],
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Dirección'),
// ),
// ),
// ),
// ),
// ],
// ),
// Text('Datos de negocio'),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 620,
// child: TextFormField(
// maxLines: 3,
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Presentación'),
// ),
// ),
// ),
// ),
// ],
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Razón social'),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Nombre de fantasía'),
// ),
// ),
// ),
// ),
// ],
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Documento o R.U.T.'),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Disponibilidad'),
// ),
// ),
// ),
// ),
// ],
// ),
// Text('Ciudades'),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Departamento'),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Ciudad'),
// ),
// ),
// ),
// ),
// ],
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Departamento'),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Ciudad'),
// ),
// ),
// ),
// ),
// ],
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Departamento'),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Ciudad'),
// ),
// ),
// ),
// ),
// ],
// ),
// ElevatedButton(
// style: ButtonStyle(
// foregroundColor: MaterialStateProperty.resolveWith(
// (states) {
// return states.contains(MaterialState.disabled)
// ? null
//     : Colors.white;
// },
// ),
// //change background color to blue if form is filled
// backgroundColor: MaterialStateProperty.resolveWith(
// (states) {
// return states.contains(MaterialState.disabled)
// ? null
//     : Colors.blue;
// },
// ),
// ),
// //display the welcome screen only when the form is completely filled
// onPressed: () {},
// child: const Text('Guardar cambios'),
// ),
// ],
// ),
// );

///otro
// Form(
// child: Column(
// mainAxisSize: MainAxisSize.max,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Modificar plan',
// style: Theme.of(context).textTheme.headline4,
// ),
// SizedBox(
// height: 80,
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Nombre del plan'),
// ),
// ),
// ),
// ),
// ],
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Total de oficios'),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Total de ciudades'),
// ),
// ),
// ),
// ),
// ],
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Precio mensual'),
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 300,
// child: TextFormField(
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Precio anual'),
// ),
// ),
// ),
// ),
// ],
// ),
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(10),
// child: SizedBox(
// width: 620,
// child: TextFormField(
// maxLines: 3,
// decoration: const InputDecoration(
// border: OutlineInputBorder(
// borderSide: BorderSide(
// color: Colors.transparent,
// width: 2.0,
// ),
// ),
// label: Text('Descripción'),
// ),
// ),
// ),
// ),
// ],
// ),
// ElevatedButton(
// style: ButtonStyle(
// foregroundColor: MaterialStateProperty.resolveWith(
// (states) {
// return states.contains(MaterialState.disabled)
// ? null
//     : Colors.white;
// },
// ),
// //change background color to blue if form is filled
// backgroundColor: MaterialStateProperty.resolveWith(
// (states) {
// return states.contains(MaterialState.disabled)
// ? null
//     : Colors.blue;
// },
// ),
// ),
// //display the welcome screen only when the form is completely filled
// onPressed: () {},
// child: const Text('Guardar cambios'),
// ),
// ],
// ),
// );