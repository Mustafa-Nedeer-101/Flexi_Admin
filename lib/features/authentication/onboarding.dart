import 'package:admin/core/common/widgets/containers/containers/rounded_container.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';

class Desktop extends StatelessWidget {
  const Desktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          SizedBox(
            height: 400,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomRoundedContainer(
                    backgroundColor: CColors.primary.withOpacity(0.2),
                    child: const Center(
                      child: Text('Box 1'),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: CustomRoundedContainer(
                            backgroundColor: CColors.warning.withOpacity(0.2),
                            child: const Center(
                              child: Text('Box 1'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomRoundedContainer(
                                  backgroundColor:
                                      CColors.warning.withOpacity(0.2),
                                  child: const Center(
                                    child: Text('Box 1'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: CustomRoundedContainer(
                                  backgroundColor:
                                      CColors.warning.withOpacity(0.2),
                                  child: const Center(
                                    child: Text('Box 1'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomRoundedContainer(
                  height: 200,
                  backgroundColor: CColors.warning.withOpacity(0.2),
                  child: const Center(
                    child: Text('Box 1'),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: CustomRoundedContainer(
                  height: 200,
                  backgroundColor: CColors.warning.withOpacity(0.2),
                  child: const Center(
                    child: Text('Box 2'),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class Tablet extends StatelessWidget {
  const Tablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          SizedBox(
            height: 400,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomRoundedContainer(
                    backgroundColor: CColors.primary.withOpacity(0.2),
                    child: const Center(
                      child: Text('Box 1'),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: CustomRoundedContainer(
                            backgroundColor: CColors.warning.withOpacity(0.2),
                            child: const Center(
                              child: Text('Box 1'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomRoundedContainer(
                                  backgroundColor:
                                      CColors.warning.withOpacity(0.2),
                                  child: const Center(
                                    child: Text('Box 1'),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: CustomRoundedContainer(
                                  backgroundColor:
                                      CColors.warning.withOpacity(0.2),
                                  child: const Center(
                                    child: Text('Box 1'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              CustomRoundedContainer(
                height: 200,
                width: double.infinity,
                backgroundColor: CColors.warning.withOpacity(0.2),
                child: const Center(
                  child: Text('Box 1'),
                ),
              ),
              const SizedBox(height: 20),
              CustomRoundedContainer(
                height: 200,
                width: double.infinity,
                backgroundColor: CColors.warning.withOpacity(0.2),
                child: const Center(
                  child: Text('Box 2'),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(children: [
          CustomRoundedContainer(
            height: 200,
            width: double.infinity,
            backgroundColor: CColors.primary.withOpacity(0.2),
            child: const Center(
              child: Text('Box 1'),
            ),
          ),
          const SizedBox(height: 20),
          CustomRoundedContainer(
            height: 200,
            width: double.infinity,
            backgroundColor: CColors.warning.withOpacity(0.2),
            child: const Center(
              child: Text('Box 1'),
            ),
          ),
          const SizedBox(height: 20),
          CustomRoundedContainer(
            height: 200,
            width: double.infinity,
            backgroundColor: CColors.warning.withOpacity(0.2),
            child: const Center(
              child: Text('Box 1'),
            ),
          ),
          const SizedBox(height: 20),
          CustomRoundedContainer(
            height: 200,
            width: double.infinity,
            backgroundColor: CColors.warning.withOpacity(0.2),
            child: const Center(
              child: Text('Box 1'),
            ),
          ),
          const SizedBox(height: 20),
          CustomRoundedContainer(
            height: 200,
            width: double.infinity,
            backgroundColor: CColors.warning.withOpacity(0.2),
            child: const Center(
              child: Text('Box 1'),
            ),
          ),
          const SizedBox(height: 20),
          CustomRoundedContainer(
            height: 200,
            width: double.infinity,
            backgroundColor: CColors.warning.withOpacity(0.2),
            child: const Center(
              child: Text('Box 2'),
            ),
          )
        ]),
      ),
    );
  }
}
