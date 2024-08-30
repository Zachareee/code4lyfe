import {StyleSheet} from 'react-native';

const styles = StyleSheet.create({
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
  
  export default styles;