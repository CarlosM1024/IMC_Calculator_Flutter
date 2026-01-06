import 'package:flutter/material.dart';

class Pantalla01 extends StatefulWidget {
  const Pantalla01({super.key, required this.title});
  final String title;

  @override
  State<Pantalla01> createState() => _Pantalla01State();
}

class _Pantalla01State extends State<Pantalla01> {
  final TextEditingController _controlPeso = TextEditingController();
  final TextEditingController _controlAltura = TextEditingController();

  String _clasificacion = '';
  String _valorIMC = '';
  Color _colorEstado = Colors.indigo;

  void _calcularIMC() {
    // tryParse evita que la app truene si el input es inválido
    final double? peso = double.tryParse(_controlPeso.text);
    final double? alturaCm = double.tryParse(_controlAltura.text);

    if (peso == null || alturaCm == null || alturaCm <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa valores válidos')),
      );
      return;
    }

    double alturaM = alturaCm / 100;
    double imc = peso / (alturaM * alturaM);

    setState(() {
      _valorIMC = imc.toStringAsFixed(1);

      if (imc < 18.5) {
        _clasificacion = 'Bajo peso';
        _colorEstado = Colors.orange;
      } else if (imc < 25) {
        _clasificacion = 'Peso normal';
        _colorEstado = Colors.green;
      } else if (imc < 30) {
        _clasificacion = 'Sobrepeso';
        _colorEstado = Colors.yellow[700]!;
      } else {
        _clasificacion = 'Obesidad';
        _colorEstado = Colors.red;
      }
    });
  }

  double _obtenerPorcentajeIMC(double imc) {
    if (imc < 18.5) {
      // Rango Bajo Peso: La barra se llena del 0% al 20%
      return (imc / 18.5) * 0.2;
    } else if (imc < 25) {
      // Rango Normal: La barra se llena del 20% al 50%
      return 0.2 + ((imc - 18.5) / (25 - 18.5)) * 0.3;
    } else if (imc < 30) {
      // Rango Sobrepeso: La barra se llena del 50% al 75%
      return 0.5 + ((imc - 25) / (30 - 25)) * 0.25;
    } else {
      // Rango Obesidad: De 75% a 100%
      double porc = 0.75 + ((imc - 30) / (40 - 30)) * 0.25;
      return porc > 1.0 ? 1.0 : porc;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _estiloEtiqueta = TextStyle(fontSize: 10, fontWeight: FontWeight.bold);
    return Scaffold(
      //backgroundColor: _fondo, //CAMBIA EL COLOR DE FONDO DE TODA LA VENTANA
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: _colorEstado, //CAMBIA EL COLOR DE FONDO DEL TITULO
      ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Icon(
              Icons.health_and_safety,
              size: 80,
              color: _colorEstado,
            ),
            const SizedBox(height: 20),
            _buildTextField(
                _controlPeso, 'Peso (Kg)', 'Kilogramos', Icons.monitor_weight),
            const SizedBox(height: 20),
            _buildTextField(
                _controlAltura, 'Altura (cm)', 'Centimetros', Icons.straighten),
            const SizedBox(height: 30),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: _calcularIMC,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _colorEstado,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                    ),
                  child: const Text('CALCULAR', style: TextStyle(color: Colors.white, fontSize: 15),),
                ),
            ),
            const SizedBox(height: 30),
            // ... dentro de la Column, debajo del botón de CALCULAR

            if (_valorIMC.isNotEmpty)
              Column(
                children: [
                  Card(
                    color: _colorEstado.withOpacity(0.1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: _colorEstado, width: 2),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text('Tu IMC es', style: TextStyle(fontSize: 16, color: _colorEstado)),
                          Text(_valorIMC,
                              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: _colorEstado)),
                          Text(_clasificacion.toUpperCase(),
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _colorEstado)),

                          const SizedBox(height: 20),

                          // INDICADOR VISUAL (Barra de progreso)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: _obtenerPorcentajeIMC(double.parse(_valorIMC)),
                              minHeight: 12,
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(_colorEstado),
                            ),
                          ),
                          // Debajo del LinearProgressIndicator
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(flex: 20, child: Text('Bajo', style: _estiloEtiqueta, textAlign: TextAlign.center)),
                              Expanded(flex: 30, child: Text('Normal', style: _estiloEtiqueta, textAlign: TextAlign.center)),
                              Expanded(flex: 25, child: Text('Sobrepeso', style: _estiloEtiqueta, textAlign: TextAlign.center)),
                              Expanded(flex: 25, child: Text('Obesidad', style: _estiloEtiqueta, textAlign: TextAlign.center)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    );
  }
  // Widget optimizado para reutilizar en los campos de texto
  Widget _buildTextField(TextEditingController controller, String label, String suffix, IconData icon) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix,
        prefixIcon: Icon(icon, color: _colorEstado),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: _colorEstado, width: 2),
        ),
      ),
    );
  }

}
