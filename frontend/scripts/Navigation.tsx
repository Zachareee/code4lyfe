import { createStackNavigator } from '@react-navigation/stack';

export type RootStackParamList = {
  Home: undefined, // undefined because you aren't passing any params to the home screen
  Profile: { name: string }; 
  Med: {name: string}
};

const Stack = createStackNavigator<RootStackParamList>();