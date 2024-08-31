import {Text, View, Button, Image, TouchableOpacity} from 'react-native';
import styles from "./styles" //CHANGE. put different style cards
import { StackNavigationProp } from '@react-navigation/stack';


   
type medType = { // what we receive from backend
  name: string; // name of medication
  startDate: number; // start date of medicine
  interval: number; // e.g. 7 = weekly, 2 = once every 2 days; to set default = 1
  image: string;
  notes: string;
  time?: Date;
};

import { RootStackParamList } from './Navigation';
type MedScreenNavigationProp = StackNavigationProp<
  RootStackParamList,
  'Med'
>;


// type Props = {
//   navigation: ProfileScreenNavigationProp;
// };

type innerMedProps = {
  name: string;
  image: string;
  time?: Date;
  navigation: MedScreenNavigationProp;
};
// WILL NEED TO DO LOGIC HERE TO SET UP




const MedInnerRow = (props: innerMedProps) => {
return (
  <View style={styles.card}>
     {/* <Button
      title="Go to Jane's profile"
      onPress={() =>
        navigation.navigate('Profile', { name: 'Jane' })
    }> */}
    <TouchableOpacity onPress={()=> props.navigation.navigate('Med', { name: 'Jane' })}>
    <View style = {{flexDirection: "row", backgroundColor: "#FFFFFF"}}>
      <Image source={{uri: 'https://p7.hiclipart.com/preview/102/271/710/tablet-pharmaceutical-drug-capsule-iconfinder-pill-png.jpg'}}
      style={styles.image} />
      <Text style = {styles.nameText}>Hello {props.name} {props.image}!</Text>
    </View>
    <View>
       <Text style = {{backgroundColor: '#000000'}}> {props.name} </Text>
    </View>
    </TouchableOpacity>
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
    // <MedInnerRow name = {props.name} image = {props.image} />
    <View style= {[styles.card, {marginBottom:10, borderBottomStartRadius: 12, borderBottomEndRadius: 12}]}>
      <Image source={{uri: 'https://p7.hiclipart.com/preview/102/271/710/tablet-pharmaceutical-drug-capsule-iconfinder-pill-png.jpg'}}
      style={{width: 20, height: '100%'}} />
      <Text> {props.name}</Text>
      <Text> {props.image} </Text>
    </View>
  )
} else {
  return (
    // <Text> Yippee </Text>
    <View>
      <View style = {styles.card}>
        <Image source={{uri: 'https://p7.hiclipart.com/preview/102/271/710/tablet-pharmaceutical-drug-capsule-iconfinder-pill-png.jpg'}}
        style={{width: 20, height: '100%'}} />
        <Text> {props.name} </Text>
        <Text> {props.image} </Text>
      </View>
      <View style={[styles.textContainer, {marginBottom:10}]}>
        <Text style = {styles.infoText}> {props.info} </Text>
      </View>
    </View>
  );
}
}




export default MedRow;