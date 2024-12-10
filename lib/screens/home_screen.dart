import 'package:flutter/material.dart';
import 'package:mvvmloginsignup/data/response/enum.dart';
import 'package:mvvmloginsignup/models/movie_model.dart';
import 'package:mvvmloginsignup/routes/routes_name.dart';
import 'package:mvvmloginsignup/uitls/utils.dart';
import 'package:mvvmloginsignup/view_model/home_view_model.dart';
import 'package:mvvmloginsignup/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel=HomeViewModel();

  @override
  void initState() {
    homeViewModel.getMovieList();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final userPrefrence=Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
        InkWell(
          onTap: (){
            userPrefrence.remove().then((value){
              Navigator.pushNamed(context,RoutesNames.login);
            });
          },
          child: Center(child: Text('Logout',style: TextStyle(color:Colors.white),))),
        SizedBox(width: 20,)
          ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context)=>homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context,value,_){
            switch(value.movieList.status){
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.movieList.data!.movies!.length,
                    itemBuilder:(context,index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(value.movieList.data!.movies![index].posterurl.toString(),
                          errorBuilder: (context,error,stack){
                            return Icon(Icons.error,color: Colors.red,);
                          },
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),

                          title: Text(value.movieList.data!.movies![index].title.toString()),
                          subtitle: Text(value.movieList.data!.movies![index].year.toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(Utils.averageRating(value.movieList.data!.movies![index].ratings!).toStringAsFixed(1)),
                              Icon(Icons.star,color: Colors.yellow,)
                            ],
                          ),
                        )
                      );
                    }
                );
              case Status.ERROR:
                return Center(child: Text(value.movieList.message.toString()));
              case null:
                return Text('Error During Communicarion No Internet Connection');
            }
            return Container();
          }),
      ),
    );
  }
}
