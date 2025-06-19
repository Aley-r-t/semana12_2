# semana12_1


## 📚 Widgets Cupertino destacados en este proyecto

> Este proyecto está construido completamente con widgets `Cupertino`, para lograr una interfaz nativa estilo iOS usando Flutter. A continuación se documentan algunos de los widgets menos comunes e interesantes usados.

---

### 🧩 `CupertinoSegmentedControl<T>`

Permite crear botones de selección al estilo iOS (ideal para campos como sexo, tipo, etc.).

```dart
CupertinoSegmentedControl<String>(
  children: const {
    'Masculino': Text('Masculino'),
    'Femenino': Text('Femenino'),
    'Otro': Text('Otro'),
  },
  groupValue: _sexo,
  onValueChanged: (value) => setState(() => _sexo = value),
)
```

### `CupertinoDatePicker<T>`

Selector de fechas con diseño nativo de iOS. Usado para elegir la fecha de nacimiento.

```dart
CupertinoDatePicker(
  mode: CupertinoDatePickerMode.date,
  initialDateTime: _fechaNacimiento,
  maximumDate: DateTime.now(),
  onDateTimeChanged: (DateTime newDate) {
    setState(() => _fechaNacimiento = newDate);
  },
)
```
Se utiliza dentro de showCupertinoModalPopup para mostrarlo como modal deslizante.


### `CupertinoListTile<T>`

Widget tipo lista con estilo iOS. Muy útil para mostrar listas de elementos (como personas o configuraciones).

```dart
CupertinoListTile(
  leading: Icon(CupertinoIcons.person),
  title: Text('Juan Pérez'),
  subtitle: Text('Masculino, 20/05/1990'),
  onTap: () {
    // Acción al tocar
  },
)
```
Alternativa iOS a ListTile. Requiere Flutter 3.10 o superior.