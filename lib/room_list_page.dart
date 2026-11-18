import 'package:flutter/material.dart';
import 'room_type.dart';

class RoomListPage extends StatefulWidget {
  const RoomListPage({
    super.key,
    required this.preferred,
    required this.guests,
    required this.checkIn,
  });

  final RoomPreference preferred;
  final int guests;
  final String checkIn;

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  late final List<RoomType> _rooms;

  @override
  void initState() {
    super.initState();
    _rooms = buildRooms(widget.preferred);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose Your Room')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Check-in ${widget.checkIn}'),
            Text('${widget.guests} guests'),
            const SizedBox(height: 16),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _rooms[index].isExpanded = isExpanded;
                });
              },
              children: _rooms.map((room) {
                return ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: room.isExpanded,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      leading: Icon(room.icon),
                      title: Text(room.name),
                    );
                  },
                  body: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(room.description),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}