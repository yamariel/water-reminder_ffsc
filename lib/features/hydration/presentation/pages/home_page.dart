import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  int currentAmountMl = 1300; // quantité déjà bue aujourd'hui
  int goalAmountMl = 2550; // objectif journalier
  final TextEditingController _freeAmountController = TextEditingController();

  
  double get progressPercent =>
      (currentAmountMl / goalAmountMl).clamp(0.0, 1.0) * 100;

 
  void _addWater(int amountMl) {
    setState(() {
      currentAmountMl += amountMl;
    });
    
  }

  @override
  void dispose() {
    _freeAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WaterReminder')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildGraduationAndGlass(),
              const SizedBox(height: 12),
              _buildProgressLabel(),
              const SizedBox(height: 24),
              _buildQuickAmountButtons(),
              const SizedBox(height: 16),
              _buildFreeAmountField(),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget _buildHeader() {
    return Row(
      children: [
        
        const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/goutte.jpg'),
        ),
  
        const SizedBox(width: 12),
        // Bulle de texte façon "speech bubble"
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.blue.shade600,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "N'attendez pas d'avoir soif pour boire.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  

  Widget _buildGraduationAndGlass() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Règle graduée à gauche
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${goalAmountMl}ml',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            // 8 petits traits de graduation
            ...List.generate(
              8,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Container(width: 20, height: 2, color: Colors.blue.shade200),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        
        Expanded(
          child: Container(
            height: 240,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue.shade200, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              '${currentAmountMl}ml\n(placeholder verre —\nà remplacer par le\nwidget)',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue.shade300),
            ),
          ),
        ),
      ],
    );
  }

  
  Widget _buildProgressLabel() {
    return Column(
      children: [
        Text(
          '${progressPercent.toStringAsFixed(0)}%',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text('Progression', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

 
  Widget _buildQuickAmountButtons() {
 
    const quickAmounts = [150, 250, 500];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: quickAmounts.map((amount) {
        return ElevatedButton(
          onPressed: () => _addWater(amount),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue.shade700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text('${amount} ml'),
        );
      }).toList(),
    );
  }

  
  Widget _buildFreeAmountField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _freeAmountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Quantité libre (ex: 330)',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.check_circle, color: Colors.blue),
            onPressed: () {
              final value = int.tryParse(_freeAmountController.text);
              if (value != null && value > 0) {
                _addWater(value);
                _freeAmountController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}