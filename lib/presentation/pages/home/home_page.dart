import 'package:flutter/material.dart';
import 'package:flutter_template_clean_architecture/domain/usecases/get_employee_by_code.dart';
import 'package:flutter_template_clean_architecture/presentation/pages/home/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: ViewModelBuilder<HomeViewModel>.reactive(
        builder: (ctx, viewModel, _) {
          return const Center(
            child: Text('Home Page'),
          );
        },
        viewModelBuilder: () => HomeViewModel(
            getEmployeeByCode: Provider.of<GetEmployeeByCode>(context)),
      ),
    );
  }
}
