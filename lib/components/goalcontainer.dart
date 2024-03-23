import 'package:flutter/material.dart';
import 'package:savvy/utils/colors.dart';

class MainGoalCard extends StatelessWidget {
  final String iconImagePath;
  final String goalName;
  final int reward;

  const MainGoalCard({
    Key? key,
    required this.iconImagePath,
    required this.goalName,
    required this.reward,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: Row(
            children: [
              Container(
                width: 40,
                child: Image.asset(iconImagePath),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Main Goal",
                      style: TextStyle(
                        color: darkGrey.withOpacity(0.7),
                        fontSize: 12,
                        fontFamily: 'Lexend',
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      goalName,
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lexend',
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "$reward ",
                    style: TextStyle(
                      fontSize: 12,
                      color: darkGrey.withOpacity(0.7),
                    ),
                  ),
                  Container(
                    height: 20,
                    child: Image.asset('lib/images/3dcoin.png'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PersonalGoalCard extends StatefulWidget {
  final String iconImagePath;
  final String goalName;
  final int reward;
  final Function? onDismissed;
  final VoidCallback? onCompleted;

  const PersonalGoalCard({
    Key? key,
    required this.iconImagePath,
    required this.goalName,
    required this.reward,
    this.onDismissed,
    this.onCompleted,
  }) : super(key: key);

  @override
  State<PersonalGoalCard> createState() => _PersonalGoalCardState();
}

class _PersonalGoalCardState extends State<PersonalGoalCard> {
  bool _isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.goalName),
      direction: DismissDirection.startToEnd,
      background: Container(
        color: primaryPurple,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        if (widget.onDismissed != null) {
          widget.onDismissed!();
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 2),
        child: Container(
          decoration: BoxDecoration(
            color: _isCompleted ? lighterBlue : Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Row(
              children: [
                Container(
                  width: 40,
                  child: Image.asset(widget.iconImagePath),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Personal Goal",
                        style: TextStyle(
                          color: darkGrey.withOpacity(0.7),
                          fontSize: 12,
                          fontFamily: 'Lexend',
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        widget.goalName,
                        style: TextStyle(
                          color: darkGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lexend',
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                Text(
                  "${widget.reward} ",
                  style: TextStyle(
                    fontSize: 12,
                    color: darkGrey.withOpacity(0.7),
                  ),
                ),
                Container(
                  height: 20,
                  child: Image.asset('lib/images/3dcoin.png'),
                ),
                IconButton(
                  icon: Icon(
                    _isCompleted
                        ? Icons.check_circle
                        : Icons.check_circle_outline,
                    color: _isCompleted ? Colors.green : Colors.grey,
                  ),
                  onPressed: () {
                    if (!_isCompleted) {
                      widget.onCompleted?.call();
                      setState(() {
                        _isCompleted = true;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
