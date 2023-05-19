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

  @override
  void initState() {
    super.initState();
  }

  Future<void> getContact() async {
    if (await Permission.contacts.request().isGranted) {
      Contact? contact = await ContactsService.openDeviceContactPicker();
      if (contact != null) {
        setState(() {
          _contacts.add(contact);
        });
      }
    }
  }

  void _selectContact(Contact contact) {
    setState(() {
      _selectedContacts.contains(contact)
          ? _selectedContacts.remove(contact)
          : _selectedContacts.add(contact);
    });
  }

  void _selectAllContacts() {
    setState(() {
      _selectedContacts = List.from(_contacts);
    });
  }

  void _deselectAllContacts() {
    setState(() {
      _selectedContacts.clear();
    });
  }

  void _deleteContacts() {
    setState(() {
      _contacts.removeWhere((contact) => _selectedContacts.contains(contact));
      _selectedContacts.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contacts'),
        actions: _selectedContacts.isNotEmpty
            ? [
          IconButton(icon: Icon(Icons.select_all), onPressed: _selectAllContacts),
          IconButton(icon: Icon(Icons.delete), onPressed: _deleteContacts),
        ]
            : [],
      ),
      body: _contacts.isNotEmpty
          ? ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          Contact contact = _contacts[index];
          bool isSelected = _selectedContacts.contains(contact);
          return ListTile(
            leading: (contact.avatar != null && contact.avatar!.isNotEmpty)
                ? CircleAvatar(
              backgroundImage: MemoryImage(contact.avatar!),
            )
                : CircleAvatar(child: Text(contact.initials())),
            title: Text('${contact.displayName ?? ''} ${ contact.phones?.first.value}'),
            trailing: isSelected
                ? Icon(Icons.check_box)
                : Icon(Icons.check_box_outline_blank),
            onLongPress: () => _selectContact(contact),
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
