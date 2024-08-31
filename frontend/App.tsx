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
          { key: 'Lisinopril', surname: 'Morning', info: 'Take with water, avoid high potassium foods.' },
          { key: 'Metformin', surname: 'Morning', info: 'Take with breakfast to reduce stomach upset.' },
          { key: 'Atorvastatin', surname: 'Evening'},
          { key: 'Furosemide', surname: 'Morning', info: 'Monitor blood pressure and kidney function.' },
          { key: 'Amlodipine', surname: 'Morning'},
          { key: 'Metoprolol', surname: 'Morning'},
          { key: 'Senna', surname: 'Morning', info: 'Take with food to reduce gastric irritation.'},
          { key: 'Simvastatin', surname: 'Morning'},
          { key: 'Donepezil', surname: 'Morning', info: 'Take before bedtime, monitor for nausea.'},
          { key: 'Warfarin', surname: 'Evening', info: 'Monitor INR levels regularly, avoid green leafy vegetables.' },
          { key: 'Gabapentin', surname: 'Night', info: 'May cause drowsiness, do not operate heavy machinery.' },
          { key: 'Omeprazole', surname: 'Morning', info: 'Take on an empty stomach before meals.' },
          { key: 'Losartan', surname: 'Morning', info: 'Take with or without food, monitor blood pressure closely.' },
        ]}

        renderItem={({item}) => <MedRow name = {item.key} image = {item.surname} info = {(item.info)}/>}
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

