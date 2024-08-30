import {Text, View, StyleSheet} from 'react-native';
// import styles from "./styles" // if unique, no need import big styles? can just put together??

const DateDisplay = () => {
    const today = new Date()
    return (
    <View>
    <Text style={dateStyle.dateText}> {today.toLocaleDateString("en-GB", 
            { weekday: 'long',  day: 'numeric', month: 'long' }
      )}</Text>
      </View>
    );
  };

const dateStyle = StyleSheet.create({
    dateText:{
        fontSize: 14,
        color:'#000',
        fontStyle:'italic'
      }
});

export default DateDisplay;