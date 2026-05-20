import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/visitor_controller.dart';
import '../models/visitor_pass_model.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/custom_input.dart';

class VisitorPassScreen extends StatelessWidget {
  const VisitorPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VisitorController());
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppTheme.primary,
          onPressed: () => Get.back(),
        ),
        title: const Text('Visitor Passes', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primary),
      ),
      body: Obx(() {
        if (controller.visitorPasses.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.badge_outlined, size: 80, color: AppTheme.outline.withValues(alpha: 0.5)),
                  const SizedBox(height: 16),
                  const Text(
                    'No Visitor Passes Generated Yet',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.primary),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Generate entry authorization passes for your visitors to grant them easy access.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppTheme.outline),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => _showCreatePassBottomSheet(context, controller),
                    icon: const Icon(Icons.add),
                    label: const Text('Generate Visitor Pass'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(24.0),
          itemCount: controller.visitorPasses.length,
          itemBuilder: (context, index) {
            final pass = controller.visitorPasses[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: InkWell(
                onTap: () => _showPassDetailBottomSheet(context, pass),
                child: GlassCard(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person, color: AppTheme.primary),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pass.visitorName,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.primary),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Code: ${pass.accessCode} • ${pass.visitDate}',
                              style: const TextStyle(color: AppTheme.outline, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.outline),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: Obx(() {
        if (controller.visitorPasses.isEmpty) return const SizedBox.shrink();
        return FloatingActionButton(
          backgroundColor: AppTheme.primary,
          foregroundColor: Colors.white,
          onPressed: () => _showCreatePassBottomSheet(context, controller),
          child: const Icon(Icons.add),
        );
      }),
    );
  }

  void _showCreatePassBottomSheet(BuildContext context, VisitorController controller) {
    final nameController = TextEditingController();
    final plateController = TextEditingController();
    final dateController = TextEditingController();
    final timeController = TextEditingController();
    final purposeController = TextEditingController();

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Generate Visitor Pass',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: 'Visitor Name',
                hint: 'Enter visitor\'s full name',
                controller: nameController,
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: 'Vehicle Plate (Optional)',
                hint: 'e.g. ZAB 4920 CC',
                controller: plateController,
              ),
              CustomInput(
                label: 'Visit Date',
                hint: 'Select date',
                controller: dateController,
                readOnly: true,
                prefixIcon: const Icon(Icons.calendar_today, color: AppTheme.primary),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (date != null) {
                    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                    dateController.text = "${months[date.month - 1]} ${date.day}, ${date.year}";
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: 'Arrival Time',
                hint: 'Select time',
                controller: timeController,
                readOnly: true,
                prefixIcon: const Icon(Icons.access_time, color: AppTheme.primary),
                onTap: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null && context.mounted) {
                    timeController.text = time.format(context);
                  }
                },
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: 'Purpose of Visit',
                hint: 'e.g. Guest, Delivery, Maintenance',
                controller: purposeController,
              ),
              const SizedBox(height: 32),
              Obx(() => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          if (nameController.text.isNotEmpty &&
                              dateController.text.isNotEmpty &&
                              timeController.text.isNotEmpty &&
                              purposeController.text.isNotEmpty) {
                            controller.createPass(
                              visitorName: nameController.text.trim(),
                              vehiclePlate: plateController.text.trim(),
                              visitDate: dateController.text.trim(),
                              arrivalTime: timeController.text.trim(),
                              purpose: purposeController.text.trim(),
                            );
                          } else {
                            Get.snackbar('Error', 'Please fill in all required fields', snackPosition: SnackPosition.BOTTOM);
                          }
                        },
                  child: controller.isLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Generate Pass',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                ),
              )),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  void _showPassDetailBottomSheet(BuildContext context, VisitorPassModel pass) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Visitor Pass Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.primary),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GlassCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      color: AppTheme.primaryContainer,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ENTRY AUTHORIZATION', style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 1.2)),
                              Text('Visitor Pass', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Icon(Icons.security, color: Colors.white70, size: 32),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppTheme.outline.withValues(alpha: 0.2)),
                            ),
                            child: const Icon(Icons.qr_code_2, size: 100, color: AppTheme.primary),
                          ),
                          const SizedBox(height: 24),
                          const Text('ACCESS CODE', style: TextStyle(color: AppTheme.outline, fontSize: 12, letterSpacing: 2)),
                          Text(pass.accessCode, style: const TextStyle(color: AppTheme.primary, fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 4)),
                          const SizedBox(height: 24),
                          const Divider(height: 1, color: AppTheme.outline),
                          const SizedBox(height: 24),
                          
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildDetail('Visitor Name', pass.visitorName)),
                              Expanded(child: _buildDetail('Vehicle Plate', pass.vehiclePlate)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: _buildDetail('Visit Date', pass.visitDate)),
                              Expanded(child: _buildDetail('Arrival Time', pass.arrivalTime)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: _buildDetail('Purpose', pass.purpose),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      color: AppTheme.surface.withValues(alpha: 0.5),
                      child: const Row(
                        children: [
                          Icon(Icons.lock, size: 16, color: AppTheme.secondary),
                          SizedBox(width: 8),
                          Text('Verified by chamDX Estate Security', style: TextStyle(fontSize: 12, color: AppTheme.outline)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  Get.snackbar('Share', 'Pass shared successfully', snackPosition: SnackPosition.BOTTOM);
                },
                icon: const Icon(Icons.share),
                label: const Text('Share Pass'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: AppTheme.primaryContainer,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () {
                  Get.snackbar('Save', 'Pass saved to gallery', snackPosition: SnackPosition.BOTTOM);
                },
                icon: const Icon(Icons.download),
                label: const Text('Save to Gallery'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: const TextStyle(fontSize: 10, color: AppTheme.outline, letterSpacing: 1)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.primary)),
      ],
    );
  }
}

