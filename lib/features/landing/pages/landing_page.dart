import 'package:flutter/material.dart';

import '../../../constants/colors_constants.dart';
import '../../../constants/images_constants.dart';
import '../../dashboard/pages/dashboard_page.dart';
import '../data/language_model.dart';
import '../widgets/leading_logo_widget.dart';
import '../widgets/leading_logo_with_profile_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: !_isCollapsed,
            selectedIndex: 0,
            onDestinationSelected: (int index) {},
            elevation: 12,
            leading: _isCollapsed
                ? const LeadingLogoWidget()
                : const Padding(
                    padding: EdgeInsets.zero,
                    child: LeadingLogoWithProfileWidget(),
                  ),
            selectedIconTheme: const IconThemeData(color: ColorsConstants.primaryColor),
            unselectedIconTheme: const IconThemeData(color: ColorsConstants.grayColor),
            selectedLabelTextStyle: const TextStyle(color: ColorsConstants.primaryColor),
            unselectedLabelTextStyle: const TextStyle(color: ColorsConstants.grayColor),
            destinations: const [
              NavigationRailDestination(
                  icon: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Icon(Icons.dashboard),
                  ),
                  label: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Text('Dashboard'),
                  ),
                  padding: EdgeInsets.only()),
              NavigationRailDestination(
                icon: Icon(Icons.calendar_month_outlined),
                label: Text('Calendar'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.chat_outlined),
                label: Text('Chat'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.email_rounded),
                label: Text('Email'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.event_note_outlined),
                label: Text('Kanban Board'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.task_rounded),
                label: Text('Tasks'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.file_copy_rounded),
                label: Text('File Manager'),
              ),
            ],
          ),
          Expanded(
            child: Scaffold(
              appBar: MainAppBar(
                onMenuPressed: () {
                  setState(() {
                    _isCollapsed = !_isCollapsed;
                  });
                },
                isCollapsed: _isCollapsed,
              ),
              body: const DashboardPage(),
            ),
          ),
        ],
      ),
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.onMenuPressed, required this.isCollapsed});

  final VoidCallback onMenuPressed;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          isCollapsed ? Icons.menu_open : Icons.menu,
          color: ColorsConstants.grayColor,
        ),
        onPressed: onMenuPressed,
      ),
      centerTitle: false,
      title: SizedBox(
        height: 40,
        width: 250,
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: DropdownButton(
            value: languages[0],
            underline: const SizedBox(),
            items: languages
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Row(
                        children: [
                          SizedBox(height: 20, width: 20, child: Image.asset(ImagesConstants.us)),
                          const SizedBox(width: 10),
                          Text(e)
                        ],
                      ),
                    ))
                .toList(),
            onChanged: (value) {},
          ),
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: ColorsConstants.grayColor),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.settings, color: ColorsConstants.grayColor),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.dark_mode, color: ColorsConstants.grayColor),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.dashboard_outlined, color: ColorsConstants.grayColor),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(ImagesConstants.avatar),
            ),
            SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
