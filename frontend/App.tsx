import React from 'react';
import {Text, View, Button, StyleSheet, Image, FlatList} from 'react-native';
import {NavigationContainer} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';


// const HomeScreen = ({navigation}) => {
//   return (
//     <Button
//       title="Go to Jane's profile"
//       onPress={() =>
//         navigation.navigate('Profile', {name: 'Jane'})
//       }
//     />
//   );
// };
// const ProfileScreen = ({navigation, route}) => {
//   return <Text>This is {route.params.name}'s profile</Text>;
// };


// const Stack = createNativeStackNavigator();

// const MyStack = () => {
//   return (
//     <NavigationContainer>
//       <Stack.Navigator>
//         <Stack.Screen
//           name="Home"
//           component={HomeScreen}
//           options={{title: 'Welcome'}}
//         />
//         <Stack.Screen name="Profile" component={ProfileScreen} />
//       </Stack.Navigator>
//     </NavigationContainer>
//   );
// };




type innerMedProps = {
    name: string;
    image: string;
    time?: Date;
  };

const MedInnerRow = (props: innerMedProps) => {
  return (
    <View style={styles.card}>
      <View style = {{flexDirection: "row", backgroundColor: "#FFFFFF"}}>
        <Image source={{uri: 'https://reactjs.org/logo-og.png'}}
        style={styles.image} />
        <Text style = {styles.nameText}>Hello {props.name} {props.image}!</Text>
      </View>
      <View>
         <Text style = {{backgroundColor: '#000000'}}> {props.name} </Text>
      </View>
      </View>
  );
};

type medProps = {
  name: string;
  image: string;
  time?: Date;
  info?: string;
};

const MedRow = (props: medProps) => {
  if (props.info == null) {
    return (
      <MedInnerRow name = {props.name} image = {props.image} />
    )
  } else {
    return (
      // <Text> Yippee </Text>
      <View>
        <View>
          <Image source={{uri: 'https://reactjs.org/logo-og.png'}}
          style={{width: 40, height: 0}} />
          <Text>Hello {props.name} {props.image}!</Text>
          <Text> {props.name} </Text>
        </View>
        <View style={styles.textContainer}>
          <Text style = {styles.infoText}> {props.info} </Text>
        </View>
      </View>
    );
  }
}

const FlatListBasics = () => {
  return (
    <View style={styles.container}>
      <FlatList
        data={[
          {key: 'Devin', surname: 'love'},
          {key: 'Dan', surname: 'love'},
          {key: 'Dominic', surname: 'love', info: 'aaaaa'},
          {key: 'Jackson', surname: 'love'},
          {key: 'James', surname: 'love'},
          {key: 'Joel', surname: 'love', info: 'aaaaaaaaaaa'},
          {key: 'John', surname: 'love'},
          {key: 'Jillian', surname: 'love'},
          {key: 'Jimmy', surname: 'love'},
          {key: 'Julie', surname: 'love'},
        ]}

        renderItem={({item}) => <MedRow name = {item.key} image = {item.surname} info = {(item.info)} />}
        ItemSeparatorComponent={() => <View style = {styles.separator}/>}
        // renderItem={({item}) => <Text style={styles.item}>{item.key} {item.surname}</Text>}
      />
    </View>
  );
};

const DateDisplay = () => {
  const today = new Date()
  return (
  <View>
  <Text style={styles.dateText}> {today.toLocaleDateString("en-GB", 
          { weekday: 'long',  day: 'numeric', month: 'long' }
    )}</Text>
    </View>
  );
};

const App = () => {
  return(
  // <NavigationContainer>
    <View
        style={[
          styles.container,
          {
            // Try setting `flexDirection` to `"row"`.
            flexDirection: 'column',
          },
        ]}>
      <DateDisplay></DateDisplay>
      <FlatListBasics></FlatListBasics>
    </View>
  // </NavigationContainer>

  )
};


const styles = StyleSheet.create({
  dateText:{
    fontSize:14,
    color:'#000',
    fontStyle:'italic'
  },
  container: {
    flex: 1,
    paddingTop: 22,
    paddingHorizontal: 10,
    backgroundColor: '#558D97',
  },
  card: {
    alignItems:'center',
    justifyContent: 'space-between',
    flexDirection: 'row',
    backgroundColor: '#C4DDDE',
    borderRadius: 8,
    padding: 10,
    marginVertical: 5,
    shadowColor: '#000',
    shadowOpacity: 0.1,
    shadowRadius: 5,
    elevation: 3,
  },
  image: {
    width: 50,
    height: 50,
    borderRadius: 25,
    marginRight: 15,
  },
  textContainer: {
    justifyContent: 'center',
    flex: 1,
  },
  nameText: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#333',
  },
  infoText: {
    fontSize: 14,
    color: '#666',
    marginTop: 5,
  },
  separator: {
    height: 10,
  },
});



export default App;

