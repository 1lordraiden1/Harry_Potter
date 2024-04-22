import 'package:flutter/material.dart';

class oneCharacterSpec extends StatelessWidget {
  const oneCharacterSpec({
    super.key, required this.specKey, required this.value,
  });

  final String specKey;
  final String value;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.purple),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  specKey,
                  style: Theme.of(context).textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                ":",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Expanded(
              flex: 10,
              child: Text(
                value,
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}