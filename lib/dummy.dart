Padding(
padding: const EdgeInsets.only(top: 40.0, left: 10,right:10),
child: Column(
children: [
SizedBox(
height: 50,
width: double.infinity,
child: Row(
children: [
CircleAvatar(
radius: 25,
foregroundImage: NetworkImage(
"assets/image/images.jpg",
),
),

SizedBox(width: 10),

Column(
children: [
Text(
"WelCome",
style: TextStyle(
color: Colors.grey,
fontSize: 15,
fontWeight: FontWeight.w400,
),
),

Text(
"RaviRaj",
style: TextStyle(
color: Colors.black,
fontSize: 15,
fontWeight: FontWeight.bold,
),
),
],
),
Spacer(),

IconButton(
onPressed: () {},
icon: Icon(Icons.notifications_none_outlined),
),
],
),
),
SizedBox(height: 15),

TextField(
controller: searchController,
decoration: InputDecoration(
hintText: "Let's see what happened today",
hintStyle: TextStyle(
color: Colors.grey,
fontSize: 16,
fontWeight: FontWeight.w500,
),
filled: true,
fillColor: Colors.grey.shade200,
prefixIcon: Icon(
Icons.search,
color: Colors.grey,
size: 25,
),
suffixIcon: Icon(Icons.mic, color: Colors.grey, size: 25),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: BorderSide.none,
),
),
),
SizedBox(height: 20),

Row(
children: [
Text(
"Breaking News !",
style: TextStyle(
color: Colors.black,
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
SizedBox(height: 15),
Spacer(),
Text(
"See all",
style: TextStyle(
color: Colors.blue,
fontSize: 15,
fontWeight: FontWeight.w500,
),
),
SizedBox(height: 15),
],
),
SizedBox(height: 20),

SizedBox(
height: 200,
width: double.infinity,
child: ListView.builder(
scrollDirection: Axis.horizontal,
itemCount: articles.length,
itemBuilder: (context, index) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 5.0),
child: Container(
padding: EdgeInsets.all(10),
height: 200,
width: 325,
decoration: BoxDecoration(
image: DecorationImage(
image: NetworkImage(
articles[index].urlToImage ?? "",
),
fit: BoxFit.cover,
),
color: Colors.blueAccent,
borderRadius: BorderRadius.circular(10),
),
child: Column(
children: [
///First Row
Row(
children: [
Container(
padding: EdgeInsets.all(2.0), height: 35, width: 55,
decoration: BoxDecoration(color: Colors.white.withOpacity(0.5),
borderRadius: BorderRadius.circular(10),
),
child: Row(
children: [
Icon(Icons.local_fire_department, color: Colors.orange, size: 20,),
SizedBox(width: 5),
Text( "Hot",
style: TextStyle( color: Colors.white, fontSize: 10,
fontWeight: FontWeight.bold,
),
),
],
),
),
Spacer(flex: 5),

///id
Container(
padding: const EdgeInsets.all(4.0),
height: 35, width: 50,
decoration: BoxDecoration(
color: Colors.white.withOpacity(0.5),
borderRadius: BorderRadius.circular(10),
),
child: Center(
child: Text(
articles[index].source?.name ?? "",
maxLines: 2,
overflow: TextOverflow.ellipsis,
textAlign: TextAlign.center,
style: TextStyle( color: Colors.white, fontSize: 10,
fontWeight: FontWeight.bold,
),
),
),
),
Spacer(flex: 1),

///name
Container(
padding: const EdgeInsets.all(4.0),
height: 35, width: 50,
decoration: BoxDecoration(
color: Colors.white.withOpacity(0.5),
borderRadius: BorderRadius.circular(10),
),
child: Center(
child: Text( articles[index].source?.name ?? "",
maxLines: 2,
overflow: TextOverflow.ellipsis,
textAlign: TextAlign.center,
style: TextStyle( color: Colors.white,
fontSize: 10, fontWeight: FontWeight.bold,
),
),
),
),
],
),
Spacer(),

///Second Row
Row(
children: [
CircleAvatar(radius: 15,
backgroundColor: Colors.black,
foregroundImage: NetworkImage( articles[index].urlToImage ?? "",
),
),
SizedBox(width: 5),

///author
SizedBox( width: 110,
child: Text(articles[index].author ?? "",
// maxLines:2,
overflow: TextOverflow.ellipsis,
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.white,
fontSize: 14,
fontWeight: FontWeight.w500,
),
),
),
Spacer(flex: 2),

///publishAt
SizedBox(width: 110,
child: Text(
articles[index].publishedAt ?? "",
maxLines: 1,
overflow: TextOverflow.ellipsis,
textAlign: TextAlign.center,
style: TextStyle( color: Colors.white, fontSize: 14,
fontWeight: FontWeight.w500,
),
),
),
Spacer(flex: 2),

///likes
Container(height: 30, width: 50,
decoration: BoxDecoration( color: Colors.transparent,
borderRadius: BorderRadius.circular(10),
),
child: Row(
children: [
Icon(Icons.favorite, color: Colors.red, size: 20,),
Text("5.2k", style: TextStyle(color: Colors.white,
fontSize: 14, fontWeight: FontWeight.w500,
),
),
],
),
),
],
),
SizedBox(height: 5),

///Third Line
Text( articles[index].description ?? "",
maxLines: 2,
overflow: TextOverflow.ellipsis,
style: TextStyle(color: Colors.white, fontSize: 12,
fontWeight: FontWeight.w500,
),
),
],
),
),
);
},
),
),

SizedBox(height: 20),

Row(
children: [
Text("Trending Right Now",
style: TextStyle(color: Colors.black,
fontSize: 20, fontWeight: FontWeight.bold,
),
),
SizedBox(height: 15),
Spacer(),
Text("See all",
style: TextStyle( color: Colors.blue,
fontSize: 15, fontWeight: FontWeight.w500,
),
),
SizedBox(height: 15),
],
),
SizedBox(height: 20),

/// Category News
SizedBox(
height: 220,
child: ListView.builder(
shrinkWrap: true,
 physics:NeverScrollableScrollPhysics(),
scrollDirection: Axis.vertical,
itemBuilder: (context, index) {
return Row(
children: [
Container(
margin: EdgeInsets.only(bottom: 8),
height: 100,
width: 100,
decoration: BoxDecoration(
color: Colors.blueAccent,
borderRadius: BorderRadius.circular(10),
),
),
SizedBox(width:5),

Container(
padding: EdgeInsets.only(left:4, right:4, top:4, bottom:4),
height: 100,
width:229,
decoration: BoxDecoration(color:Colors.transparent,
borderRadius: BorderRadius.circular(10),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
///first row
Text(
"Technology\\Automobiles",
textAlign: TextAlign.start,
style: TextStyle(
fontSize: 15,
fontWeight: FontWeight.w500,
color: Colors.grey,
),
),
SizedBox(height: 5),

///secondRow
Text(
"Technology\\Automobiles",
textAlign: TextAlign.start,
maxLines: 2,
overflow: TextOverflow.ellipsis,
style: TextStyle(
color: Colors.black,
fontSize: 12,
fontWeight: FontWeight.w500,
),
),
SizedBox(height: 11),

///third row
Row(
mainAxisAlignment: MainAxisAlignment.start,
children: [
CircleAvatar(
radius: 12,
backgroundColor: Colors.blue,
foregroundImage: NetworkImage(""),
),
SizedBox(width:5),

///author
Text(
"Author", maxLines:2,
overflow: TextOverflow.ellipsis,
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.black,
fontSize: 14,
fontWeight: FontWeight.w500,
),
),
SizedBox(width:5),

///publishAt
Text(
"Time",
maxLines: 1,
overflow: TextOverflow.ellipsis,
textAlign: TextAlign.center,
style: TextStyle(
color: Colors.black,
fontSize: 14,
fontWeight: FontWeight.w500,
),
),
SizedBox(width:5),

///likes
Container(
height: 30,
width: 50,
decoration: BoxDecoration(
color: Colors.transparent,
borderRadius: BorderRadius.circular(10),
),
child: Row(
children: [
Icon(Icons.favorite, color: Colors.red, size: 20),
Text(
"4k",
style: TextStyle(
color: Colors.black,
fontSize: 14,
fontWeight: FontWeight.w500,
),
),
],
),
),
SizedBox(width:5),

///Comments
Container(
height: 30, width: 50,
decoration: BoxDecoration(
color: Colors.transparent,
borderRadius: BorderRadius.circular(10),
),
child: Row(
children: [
Icon(Icons.message_outlined, color: Colors.red, size: 20),
Text("3.5k", style: TextStyle(
color: Colors.black, fontSize: 14,
fontWeight: FontWeight.w500,
),
),
],
),
),
],
),
],
),
),
],
);
},
),
),
],
),
);