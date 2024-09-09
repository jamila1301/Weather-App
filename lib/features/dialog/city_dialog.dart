import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/app_colors.dart';
import 'package:weather_app/core/theme/app_typography.dart';
import 'package:weather_app/features/dialog/city_service.dart';

class CityDialog extends StatefulWidget {
  final CityService cityService;

  const CityDialog({super.key, required this.cityService});

  @override
  CityDialogState createState() => CityDialogState();
}

class CityDialogState extends State<CityDialog> {
  final TextEditingController _controller = TextEditingController();
  List<String> _citySuggestions = [];
  List<String> _allCities = [];
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  Future<void> _loadCities() async {
    final cities = await widget.cityService.loadCities();
    setState(() {
      _allCities = cities;
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final filteredCities = widget.cityService.filterCities(query, _allCities);
      setState(() {
        _citySuggestions = filteredCities;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'New Location',
              style: AppTypography.sp25w600.copyWith(color: AppColors.purple),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search Cities',
                border: OutlineInputBorder(),
              ),
              onChanged: _onSearchChanged,
            ),
            const SizedBox(height: 10),
            _citySuggestions.isNotEmpty
                ? SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: _citySuggestions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_citySuggestions[index]),
                          onTap: () {
                            _controller.text = _citySuggestions[index];
                            setState(() {
                              _citySuggestions = [];
                            });
                          },
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purple,
              ),
              child: Text(
                'Search',
                style: AppTypography.sp16w400.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
