import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class SliderMenu extends StatelessWidget {
  const SliderMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: const Color.fromRGBO(228, 228, 228, 1),
      child: Column(
        children: [
          Container(
            margin:const EdgeInsets.fromLTRB(10, 10, 10,0 ),
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: ClipRRect(
              borderRadius:const BorderRadius.all(Radius.circular(10)),
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height:8),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  shape:BoxShape.circle,
                  color: Colors.grey
                ),
              ),
    
              const SizedBox(width: 3,),
              Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  shape:BoxShape.circle,
                  color: Colors.grey
                ),
              ),
    
              const SizedBox(width: 3,),
              Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  shape:BoxShape.circle,
                  color: Colors.grey
                ),
              ),
    
              const SizedBox(width: 3,),
              Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  shape:BoxShape.circle,
                  color: Colors.grey
                ),
              ),
    
              const SizedBox(width: 3,),
              Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  shape:BoxShape.circle,
                  color: Colors.grey
                ),
              ),
    
              const SizedBox(width: 3,),
              
            ],
          )
        ],
        
      ),
    );
  }
  
}