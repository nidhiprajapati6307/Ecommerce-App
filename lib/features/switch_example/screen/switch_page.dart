import 'package:ecommerce_desi/features/switch_example/bloc/switch_bloc.dart';
import 'package:ecommerce_desi/features/switch_example/bloc/switch_event.dart';
import 'package:ecommerce_desi/features/switch_example/bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchState>(
                    builder: (context, state) {
                      return Switch(
                          value: state.isSwitch,
                          onChanged: (newValue) {
                            print(newValue);
                            context.read<SwitchBloc>().add(
                                EnableOrDisableNotification());
                          });
                    })
              ],
            ),
            SizedBox(height: 30,),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),
            SizedBox(height: 30,),
            BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Slider(
                      value: state.slider,
                      onChanged: (value) {
                        print(value);
                        context.read<SwitchBloc>().add(
                            SliderEvent(silder: value));
                      });
                }),

          ],
        ),
      ),

    );
  }
}
