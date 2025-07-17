import 'package:crescent_care/controllers/statemanager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filtersubmitted extends StatelessWidget {
  const Filtersubmitted({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Statemaneger>(context);
    return Container(
      width: 360,
      height: 302,
      decoration: const BoxDecoration(
        color: Color(0xFF6962BB),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 1)),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            height: 43,
            width: 360,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Filters",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    provider.submittedpopupshow(false);
                  },
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          // Body
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  // Filters Section
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 360,
                    // height: 136,
                    child: Column(
                      children: [
                        buildInputField(
                          "Reference Number",
                          "Filter by claim number",
                        ),
                        const SizedBox(height: 15),
                        buildInputField("Date", "Filter by date"),
                      ],
                    ),
                  ),

                  // Apply Button Section
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () {
                          provider.submittedpopupshow(false);
                        },
                        child: Container(
                          width: 102,
                          height: 25,
                          decoration: BoxDecoration(
                            color: const Color(0xFF332A64),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.filter_list,
                                size: 15,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Apply Filters",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF595959),
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 35,
          width: 335,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            border: Border.all(color: Color(0xFFF0F0F0)),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              hint,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF595959),
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
