import React from 'react';
import {View, Text, Button, FlatList} from 'react-native';
import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';
import { RootStackParamList } from './scripts/Navigation';

import styles from "./scripts/styles";
import MedRow from "./scripts/MedRow";
import DateDisplay from './scripts/DateDisplay';

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

const Stack = createStackNavigator<RootStackParamList>();
const HomeScreen = () => {
  return(
    <View
        style={[
          styles.container, {flexDirection: 'column',},
        ]}>

      <DateDisplay></DateDisplay>
      <FlatListBasics></FlatListBasics>
    </View>
  )
}

const App = () => {
  return(
  <NavigationContainer>
    <Stack.Navigator>
          <Stack.Screen name="Home" component={HomeScreen} />
      </Stack.Navigator>
  </ NavigationContainer>
  )
};


export default App;

