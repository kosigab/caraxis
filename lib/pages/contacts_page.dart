import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts = [];
  List<Contact> _selectedContacts = [];
  bool _isSelectionActivated = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getContact() async {
    // Check contact permission
    if (await Permission.contacts.request().isGranted) {
      Contact? contact = await ContactsService.openDeviceContactPicker();
      if (contact != null) {
        setState(() {
          _contacts.add(contact);
        });
      }
    }
  }

  _onLongPressed(Contact contact) {
    setState(() {
      _isSelectionActivated = true;
      _selectedContacts.add(contact);
    });
  }

  _onTap(Contact contact) {
    setState(() {
      if (_selectedContacts.contains(contact)) {
        _selectedContacts.remove(contact);
      } else {
        _selectedContacts.add(contact);
      }
      if (_selectedContacts.isEmpty) {
        _isSelectionActivated = false;
      }
    });
  }

  void _selectAll() {
    setState(() {
      if (_selectedContacts.length == _contacts.length) {
        _selectedContacts.clear();
        _isSelectionActivated = false;
      } else {
        _selectedContacts = List.from(_contacts);
      }
    });
  }

  void _deleteSelectedContacts() {
    setState(() {
      _contacts.removeWhere((contact) => _selectedContacts.contains(contact));
      _selectedContacts.clear();
      _isSelectionActivated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
        actions: _isSelectionActivated
            ? [
          IconButton(icon: Icon(Icons.select_all), onPressed: _selectAll),
          IconButton(icon: Icon(Icons.delete), onPressed: _deleteSelectedContacts)
        ]
            : [],
      ),
      body: _contacts.isNotEmpty
          ? ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          Contact contact = _contacts[index];
          return ListTile(
            onTap: () => _onTap(contact),
            onLongPress: () => _onLongPressed(contact),
            leading: _isSelectionActivated
                ? Checkbox(
              value: _selectedContacts.contains(contact),
              onChanged: (value) {
                _onTap(contact);
              },
            )
                : null,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(contact.displayName ?? ''),
                Text(
                  contact.phones?.first.value ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        },
      )
          : Center(child: Text('No contacts added.')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: getContact,
      ),
    );
  }
}
