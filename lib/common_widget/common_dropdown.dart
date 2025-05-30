// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CommonDropdown<T> extends StatelessWidget {
//   final List<T> items; // List of items in the dropdown
//   final String? hint; // Placeholder text for the dropdown
//   final Rx<T?> selectedItem; // Selected item state
//   final Function(T?) onChanged; // Callback for item selection
//
//   // Additional customizations
//   final TextStyle? itemTextStyle; // Style for dropdown items
//   final TextStyle? hintStyle; // Style for the hint
//   final Color? dropdownColor; // Background color of the dropdown
//   final double borderRadius; // Border radius for dropdown menu
//   final EdgeInsets? dropdownPadding; // Padding for dropdown items
//   final Widget? dropdownIcon; // Custom dropdown icon
//
//   const CommonDropdown({
//     Key? key,
//     required this.items,
//     this.hint,
//     required this.selectedItem,
//     required this.onChanged,
//     this.itemTextStyle,
//     this.hintStyle,
//     this.dropdownColor,
//     this.borderRadius = 8.0,
//     this.dropdownPadding,
//     this.dropdownIcon,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return DropdownButton<T>(
//         isExpanded: true,
//         value: selectedItem.value,
//         hint: hint != null
//             ? Text(
//           hint!,
//           style: hintStyle ?? TextStyle(color: Colors.grey),
//         )
//             : null,
//         items: items.map((T item) {
//           return DropdownMenuItem<T>(
//             value: item,
//             child: Padding(
//               padding: dropdownPadding ?? EdgeInsets.all(8.0),
//               child: Text(
//                 item.toString(),
//                 style: itemTextStyle ?? TextStyle(fontSize: 14),
//               ),
//             ),
//           );
//         }).toList(),
//         onChanged: (T? value) {
//           selectedItem.value = value;
//           onChanged(value);
//         },
//         dropdownColor: dropdownColor,
//         icon: dropdownIcon ?? Icon(Icons.arrow_drop_down),
//         underline: SizedBox(), // Removes the default underline
//         borderRadius: BorderRadius.circular(borderRadius),
//       );
//     });
//   }
// }


import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../core/res/colors.dart';

class CommonDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final String? labelText;
  final String? hintText;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final bool isRequired;
  final bool isSearchable;

  const CommonDropdown({
    super.key,
    required this.items,
    this.selectedItem,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.validator,
    this.isRequired = false,
    this.isSearchable = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      key: key,
      selectedItem: selectedItem,
      items: (filter, infiniteScrollProps) => items,
      popupProps: isSearchable
          ? PopupProps.menu(
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: AppColor.divider, width: 1.5),
            ),
            hintText: 'Search...',
          ),
        ),
      )
          : PopupProps.menu(),
      decoratorProps: DropDownDecoratorProps(
        decoration:  InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding:
          const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: AppColor.divider, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: AppColor.divider, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(color: AppColor.primary, width: 1),
          ),
          labelText: isRequired ? '${labelText ?? ''} *' : labelText,
          hintText: hintText,
          labelStyle: const TextStyle(color: Colors.black45,fontSize: 14),
        ),
      ),

      onChanged: onChanged,
      validator: validator,
    );
  }
}




